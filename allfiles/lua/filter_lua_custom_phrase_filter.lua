--- @@ lua_custom_phrase_filter
--[[
接續掛接方案後，有 bug，上不了屏，改用 translator 實現。
--]]


---------------------------------------------------------------
--- 置入方案範例
--[[
engine:
  filter:
    - lua_filter@lua_custom_phrase_filter

lua_custom_phrase_filter:
  user_dict: "lua_custom_phrase"
--]]
---------------------------------------------------------------
-- local function file_exists(path)
--     if type(path)~="string" then return false end
--     return os.rename(path,path) and true or false
-- end

-- local function isFile(path)
--     if not file_exists(path) then return false end
--     local f = io.open(path)
--     if f then
--       local res = f:read(1) and true or false
--       f:close()
--       return res
--     end
--     return false
-- end
---------------------------------------------------------------

local function load_text_dict(text_dict)
  -- local slash = package.path:sub(1,1)  -- package.path 跑出的內容太長，不用
  local path= rime_api.get_user_data_dir()
  filename = path .. "/" .. ( text_dict or "lua_custom_phrase" ) .. ".txt" or ""  -- Mac 用
-- lua_filter 只會啟用 text_dict，如缺失無法自動轉 "lua_custom_phrase"，但 lua_translator 中重新部屬後即會轉換。

  if io.open(filename) == nil then  -- Windows 用
    filename = path .. "\\" .. ( text_dict or "lua_custom_phrase" ) .. ".txt" or ""
  end

  if io.open(filename) == nil then return {} end
  -- if not isFile(filename) then return end  -- 在 widonws 中會有問題。

  local tab = {}
  for line in io.open(filename):lines() do
    if not line:match("^#") then
      if line:match("^[^\t]+\t[0-9a-z,./; -]+[\t]?%d*$") then

        local line = string.gsub(line,"^([^\t]+\t[^\t]+)\t?.*$","%1")
        local v_text = string.gsub(line,"^(.+)\t.+","%1")
        local v_code = string.gsub(line,"^.+\t(.+)","%1")
        -- tab[v_code] = v_text  -- 一個 code 只能有一條短語，下方可一個 code，多條短語。
        if tab[v_code] == nil then
          local nn={}
          table.insert(nn, v_text)
          tab[v_code] = nn
        else
          table.insert(tab[v_code], v_text)
        end

      end
    end
  end

  return tab
end

---------------------------------------------------------------
local function init(env)
   config = env.engine.schema.config
   namespace = "lua_custom_phrase_filter"
   env.textdict = config:get_string(namespace .. "/user_dict") or ""
   -- log.info("lua_custom_phrase_filter Initilized!")
end


-- local function lua_custom_phrase_filter(input,env)
local function filter(input,env)
  local engine = env.engine
  local context = engine.context
  local start = context:get_preedit().sel_start
  local _end = context:get_preedit().sel_end
  local caret_pos = context.caret_pos
  local o_input = context.input  -- 原始未轉換輸入碼
  -- local text_dict_tab = load_text_dict("lua_custom_phrase") or {}  -- 直接限定 txt 字典
  local text_dict_tab = load_text_dict(env.textdict) or {}
  local es = _end - start
  local c_input = string.sub(o_input, -es)
  local c_p_tab = text_dict_tab[c_input] or {}
  -- local c_p_tab = text_dict_tab[o_input] or {}

  if text_dict_tab == {} then
  elseif c_p_tab then
  -- elseif caret_pos == #o_input and c_p_tab then
    for _, v in pairs(c_p_tab) do
      local v = string.gsub(v, "\\n", "\n")  -- 可以多行文本
      local v = string.gsub(v, "\\r", "\r")  -- 可以多行文本
      local cand = Candidate("short", start, _end, v, "〔短語〕")
      yield(cand)
    end
    -- local custom_phrase_cand = Candidate("short", start, _end, c_p_tab, "〔短語〕")
    -- yield( custom_phrase_cand )
  end

  for cand in input:iter() do
    yield(cand)
  end
end


-- return lua_custom_phrase_filter
return { init = init, func = filter }