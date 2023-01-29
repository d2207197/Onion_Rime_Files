--- @@ lua_custom_phrase
--[[
取代原先 table_translator@custom_phrase。
可多行，用\n\r。
--]]


---------------------------------------------------------------
--- 置入方案範例
--[[
engine:
  translators:
    - lua_translator@lua_custom_phrase

lua_custom_phrase:
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
  -- local slash = package.path:sub(1,1)  -- 實際內容太長，不用
  local path= rime_api.get_user_data_dir()
  filename = path .. "/" .. ( text_dict or "lua_custom_phrase" ) .. ".txt" or ""

  if io.open(filename) == nil then  --如果 schema 中沒設或缺檔則轉用 lua_custom_phrase.txt。
    filename = path .. "\\" .. ( text_dict or "lua_custom_phrase" ) .. ".txt" or ""
  end

  if io.open(filename) == nil then return end
  -- if not isFile(filename) then return end  -- 在 widonws 中會有問題。

  local tab = {}
  for line in io.open(filename):lines() do
    if not line:match("^#") and line:match("^[^\t]+\t[0-9a-z,./; -]+[\t]?%d*$") then

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

  return tab
end

---------------------------------------------------------------
local function init(env)
   config = env.engine.schema.config
   namespace = "lua_custom_phrase"
   env.textdict = config:get_string(namespace .. "/user_dict") or ""
   -- log.info("lua_custom_phrase Initilized!")
   env.quality = 10
end


local function translate(input, seg, env)
  if env.textdict == "" then return end

  local engine = env.engine
  local context = engine.context
  -- local caret_pos = context.caret_pos
  -- local text_dict_tab = load_text_dict("lua_custom_phrase") or {}  -- 直接限定 txt 字典
  local text_dict_tab = load_text_dict(env.textdict) or {}
  local c_p_tab = text_dict_tab[input] or {}

  if c_p_tab then
  -- if caret_pos == #input and c_p_tab then  --只能在一開頭輸入
    for _, v in pairs(c_p_tab) do
      local v = string.gsub(v, "\\n", "\n")  -- 可以多行文本
      local v = string.gsub(v, "\\r", "\r")  -- 可以多行文本
      local cand = Candidate("short", seg.start, seg._end, v, "〔短語〕")
      cand.quality = env.quality
      yield(cand)
    end
    -- local custom_phrase_cand = Candidate("short", start, _end, c_p_tab, "〔短語〕")
    -- yield( custom_phrase_cand )
  end

  -- --- 以下測試用
  -- if (string.match(input, "^11$")~=nil) then
  --   cand.quality = env.quality
  --   yield( Candidate("short", seg.start, seg._end, '『測試用』', "〔短語〕") )
  --   yield(cand)

end


return {init = init, func = translate}
---------------------------------------------------------------
--- 參考
--[[
-- return Translation
local function eng_tran(dict,mode,prefix_comment,cand)

  return Translation(function()
    -- 使用 context.input 查字典 type "english"
    local inp = cand.text
    for w in dict:iter(inp) do
      -- system_format 處理 comment 字串長度 格式
      local comment = system_format(  prefix_comment..w:get_info(mode) )
      local commit = sync_case(inp,w.word)
      -- 如果 與 字典相同 替換 first_cand cand.comment
      if cand.text:lower() == commit:lower() then
        cand.comment= comment
      else
        yield( ShadowCandidate(cand,cand.type,commit,comment) )
      end
    end
  end)
end
--]]