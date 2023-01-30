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
  --- 當輸入 text_dict 不為 string 則跳開，該函數為 nil。
  if type(text_dict) ~= "string" then return end

  -- local slash = package.path:sub(1,1)  -- package.path 跑出的內容太長，不用。
  local path= rime_api.get_user_data_dir()
  filename = path .. "/" .. text_dict .. ".txt"  -- Mac 用
  -- local filename = path .. "/" .. ( text_dict or "lua_custom_phrase" ) .. ".txt"  -- Mac 用（如 text_dict 為 nil，下方已跳開，可不用 or ）

  if io.open(filename) == nil then
    filename = path .. "\\" .. text_dict .. ".txt"  -- Windows 用
    -- filename = path .. "\\" .. ( text_dict or "lua_custom_phrase" ) .. ".txt"  -- Windows 用（如 text_dict 為 nil，下方已跳開，可不用 or ）
  end

  --- 當找不到該 txt 字典檔案則跳開，該函數為 nil。
  -- if not isFile(filename) then return end  -- 在 widonws 中會有問題。
  -- if io.open(filename) == nil then return log.error("lua_custom_phrase： Missing user_dict File!") end  -- 錯誤日誌中提示遺失檔案（不存在）
  if io.open(filename) == nil then return end

  local tab = {}
  for line in io.open(filename):lines() do
    if not line:match("^#") then
      if line:match("^[^\t]+\t[%d%l,./; -]+\t?%d*$") then

        local line = string.gsub(line,"^([^\t]+\t[^\t]+)\t?.*$","%1")
        local v_text = string.gsub(line,"^(.+)\t.+$","%1")
        local v_code = string.gsub(line,"^.+\t(.+)$","%1")
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
  --- 以下 「load_text_dict」 可能為 nil 故要 or {}
  env.tab = load_text_dict(env.textdict) or {}  -- 更新 txt 需「重新部署」或方案變換
  -- log.info("lua_custom_phrase_filter: \'" .. env.textdict .. ".txt\' Initilized!")  -- 日誌中提示已經載入 txt 短語
end


-- local function lua_custom_phrase_filter(input,env)
local function filter(input,env)
  local engine = env.engine
  local context = engine.context
  local start = context:get_preedit().sel_start
  local _end = context:get_preedit().sel_end
  local caret_pos = context.caret_pos
  local es = _end - start
  local o_input = context.input  -- 原始未轉換輸入碼
  local c_input = string.sub(o_input, -es)
  --- 以下 「load_text_dict」 可能為 nil 故要 or {}
  -- local text_dict_tab = load_text_dict("lua_custom_phrase") or {}  -- 直接限定 txt 字典
  -- local text_dict_tab = load_text_dict(env.textdict) or {}  -- 更新 txt 不需「重新部署」
  --- {}['xxx'] 拋出 nil
  -- local c_p_tab = text_dict_tab[c_input]  -- 更新 txt 不需「重新部署」
  -- local c_p_tab = text_dict_tab[o_input]  -- 更新 txt 不需「重新部署」
  local c_p_tab = env.tab[c_input]

  if env.textdict == "" then
  elseif env.tab == {} then
  -- if text_dict_tab == {} then
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