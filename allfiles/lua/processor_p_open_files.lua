--- @@ p_open_files
--[[
快捷鍵開啟檔案/程式/網站
--]]

----------------------------------------------------------------------------------------
local generic_open = require("p_components/p_generic_open")
----------------------------------------------------------------------------------------

-- local function generic_open(dest)
--   if os.execute('start "" ' .. dest) then
--     return true
--   elseif os.execute('open ' .. dest) then
--     return true
--   elseif os.execute('xdg-open ' .. dest) then
--     return true
--   end
-- end


local function init(env)
  local engine = env.engine
  local schema = engine.schema
  local config = schema.config
  local namespace1 = "mf_translator"
  local namespace2 = "lua_custom_phrase"
  local path = rime_api.get_user_data_dir()
  env.prefix = config:get_string(namespace1 .. "/prefix") or ""
  env.textdict = config:get_string(namespace2 .. "/user_dict") or ""
  env.custom_phrase_file_name = path .. "/" .. env.textdict .. ".txt" or ""
  -- log.info("lua_custom_phrase: \'" .. env.textdict .. ".txt\' Initilized!")  -- 日誌中提示已經載入 txt 短語
end


-- local function p_open_files(key, env)
local function processor(key, env)
  local engine = env.engine
  local context = engine.context
  local c_input = context.input
  local comp = context.composition
  local seg = comp:back()
  local o_ascii_mode = context:get_option("ascii_mode")

  -- if env.textdict == "" or env.prefix == "" then
  if env.prefix == "" then
    return 2

  elseif o_ascii_mode then
    return 2
  --- prevent segmentation fault (core dumped) （避免進入死循環，有用到 seg=comp:back() 建議使用去排除？）
  elseif comp:empty() then
    return 2
  --- pass release ctrl alt super
  elseif key:release() or key:ctrl() or key:alt() or key:super() then
    return 2

  elseif c_input == env.prefix .. "op" then  -- 開頭
  -- elseif string.match(c_input, env.prefix .. "op$") then  -- 隨時
    if not seg:has_tag("mf_translator") then
      return 2

    -- elseif key:repr() == "t" then  -- 測試用
    --   -- io.popen("env.custom_phrase_file_name")  -- 無效！
    --   -- engine:commit_text(env.textdict)  -- 測試用
    --   generic_open("/System/Applications/Dictionary.app")
    --   context:clear()
    --   return 1
    -- elseif key:repr() == "自行定義鍵位" then
    --   generic_open("自行定義欲開啟程式或網站")
    --   context:clear()
    --   return 1

    elseif key:repr() == "r" then
      generic_open("https://github.com/rime")
      context:clear()
      return 1
    elseif key:repr() == "o" then
      generic_open("https://github.com/oniondelta/Onion_Rime_Files")
      context:clear()
      return 1

    elseif env.textdict == "" then
      return 2
    elseif key:repr() == "p" then
      generic_open(env.custom_phrase_file_name)
      context:clear()
      return 1

    end

  end

  return 2 -- kNoop
end

-- return p_open_files
-- return { func = processor }
return { init = init, func = processor }