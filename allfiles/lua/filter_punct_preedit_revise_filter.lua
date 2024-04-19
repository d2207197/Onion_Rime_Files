--- @@ punct_preedit_revise_filter
--[[
（ bopomo_onion_double 和 onion-array30 ）
punct 下，附加 preedit 後面 prompt 缺漏之標示。
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

-- --- 「tags_match」和 shcema 中的「tags:」只能擇其一使用。兩者同存時只有「tags_match」作用。
-- local function tags_match(seg,env)
-- -- function M.tags_match(seg, env)
--   local engine = env.engine
--   local context = engine.context
--   local c_input = context.input
--   local caret_pos = context.caret_pos
--   local seg_punct = seg:has_tag("punct")  -- 可改在 schema 限定
--   -- local seg_punct = seg.has_tag(seg,"punct")  -- 另一種寫法
--   -- local seg_punct = not seg:has_tag("abc")  -- 可通用
--   -- local seg_punct = seg:has_tag("punct") and not seg:has_tag("mf_translator")  -- 無法
--   check_input_1 = string.match(c_input, "^`$" ) or string.match(c_input, "[^=]`$" )
--   check_input_2 = caret_pos == 2 and string.match(c_input, "^e([a-z,./;'])$" )
--   return seg_punct and (check_input_1 or check_input_2)
--   -- return check_input_1 or check_input_2
-- end

local function filter(inp, env)
-- function M.func(inp, env)
  local engine = env.engine
  local context = engine.context
  local c_input = context.input
  local caret_pos = context.caret_pos
  -- local composition = context.composition
  -- local seg = composition:back()

  local check_input_1 = string.match(c_input, "^`$" ) or string.match(c_input, "[^=]`$" )
  local check_input_2 = caret_pos == 2 and string.match(c_input, "^e([a-z,./;'])$" )
  -- seg.prompt = "《特殊功能集》▶"  -- 全部的 prompt 都會改寫

  for cand in inp:iter() do
    yield(check_input_1 and cand.text == "`" and change_preedit(cand, cand.preedit .."\t《特殊功能集》▶") or
          check_input_2 and change_preedit(cand, "e " .. string.upper(check_input_2) .. "\t《查詢鍵位注音》") or
          cand
         )
  end

end

return { func = filter }
-- return { func = filter, tags_match = tags_match }
-- return M