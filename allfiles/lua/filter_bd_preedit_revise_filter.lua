--- @@ bd_preedit_revise_filter
--[[
（ bopomo_onion_double ）
附加 preedit 樣式後面 prompt 缺漏之標示。
--]]

----------------------------------------------------------------------------------------

local change_preedit = require("filter_cand/change_preedit")

----------------------------------------------------------------------------------------
-- local M={}

-- local function init(env)
-- function M.init(env)
-- end

-- local function fini(env)
-- function M.fini(env)
-- end

local function tags_match(seg,env)
-- function M.tags_match(seg, env)
  local engine = env.engine
  local context = engine.context
  local p_key = context.input
  local caret_pos = context.caret_pos
  local seg_punct = seg:has_tag("punct")
  -- local seg_punct = seg.has_tag(seg,"punct") -- 另一種寫法
  -- local seg_punct = not seg:has_tag("abc")  -- 可通用
  -- local seg_punct = seg:has_tag("punct") and not seg:has_tag("mf_translator")  -- 無法
  check_input_1 = string.match(p_key, "^`$" ) or string.match(p_key, "[^=]`$" )
  check_input_2 = caret_pos == 2 and string.match(p_key, "^e([a-z,./;'])$" )
  return seg_punct and (check_input_1 or check_input_2)
end

local function filter(input, env)
-- function M.func(input, env)
  local engine = env.engine
  local context = engine.context
  -- local composition = context.composition
  -- local seg = composition:back()
  -- seg.prompt = "《特殊功能集》▶"  -- 全部的 prompt 都會改寫
  for cand in input:iter() do
    yield(check_input_1 and cand.text == "`" and change_preedit(cand, cand.preedit .."\t《特殊功能集》▶") or
          check_input_2 and change_preedit(cand, "e " .. string.upper(check_input_2) .. "\t《查詢鍵位注音》") or
          cand
         )
  end
end


return { func = filter, tags_match = tags_match }
-- return M