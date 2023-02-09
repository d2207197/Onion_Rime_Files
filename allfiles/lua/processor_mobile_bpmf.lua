--- @@ mobile_bpmf
--[[
（手機注音用）
使 email_url_translator 功能按空白都能直接上屏
--]]

-- local function mobile_bpmf(key, env)
local function processor(key, env)
  local engine = env.engine
  local context = engine.context
  local input_m = context.input
  local orig_m = context:get_commit_text()
  -- local check_i1 = string.match(input_m, "^[a-z][-_.0-9a-z]*@.*$")
  -- local check_i2 = string.match(input_m, "^https?:.*$")
  -- local check_i3 = string.match(input_m, "^ftp:.*$")
  -- local check_i4 = string.match(input_m, "^mailto:.*$")
  -- local check_i5 = string.match(input_m, "^file:.*$")
  local check_i = string.match(input_m, "^[a-z][-_.0-9a-z]*@.*$") or
                  string.match(input_m, "^https?:.*$") or
                  string.match(input_m, "^ftp:.*$") or
                  string.match(input_m, "^mailto:.*$") or
                  string.match(input_m, "^file:.*$")

  -- if context:get_option("ascii_mode") then
  --   return 2
  -- elseif (not context:is_composing()) then
  --   return 2
  if key:repr() == "space" and context:is_composing() then
    -- local input_m = context.input
    if check_i then
    -- if check_i1 or check_i2 or check_i3 or check_i4 or check_i5 then
    -- if ( string.match(input_m, "[@:]")) then
      -- local orig_m = context:get_commit_text()
      engine:commit_text(orig_m)
      context:clear()
      return 1 -- kAccepted
    end
  end

  return 2 -- kNoop
end

-- return mobile_bpmf
-- return { mobile_bpmf = mobile_bpmf }
return { func = processor }
-- return { init = init, func = selector }
