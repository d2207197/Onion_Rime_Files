--- @@ comment_filter_unicode_debug
--[[
（注音plus、注音mixin、ocm全系列）
註釋 Unicode 編碼 和 debug 訊息
--]]
----------------

-- local change_comment = require("filter_cand/change_comment")
-- local change_preedit = require("filter_cand/change_preedit")
local utf8comment = require("filter_cand/utf8comment")
local debugcomment = require("filter_cand/debugcomment")
-- local url_encode = require("f_components/f_url_encode")

----------------
-- local M={}
local function init(env)
-- function M.init(env)
  local engine = env.engine
  local schema = engine.schema
  local config = schema.config
  local schema_id = config:get_string("schema/schema_id")
  -- local s_bo = string.match( schema_id, "^bo")
  local s_1 = string.match( schema_id, "^bo_mixin")
  local s_2 = string.match( schema_id, "^bopomo_onionplus")
  -- -- local s_3 = string.match( schema_id, "^bopomo_onion_double")
  -- -- local s_4 = string.match( schema_id, "^onion[-]array30") -- 開頭含有空碼「⎔」，選單會整個消失。
  -- local s_5 = string.match( schema_id, "^ocm_")
  -- local s_6 = string.match( schema_id, "^dif1")
  check_schema = function(input)
    -- if s_bo then
    if s_1 or s_2 then
      check_input = not string.match(input, "``?$") or string.match(input, "=``?$")
    else
      check_input = not string.match(input, "^;;?$")
    end
  end
end

-- function M.fini(env)
-- end

local function tags_match(seg,env)
  local engine = env.engine
  local context = engine.context
  seg_1 = seg:has_tag("mf_translator")
  seg_2 = seg:has_tag("email_url_translator")
  seg_3 = seg:has_tag("easy_en") or seg:has_tag("easy_en_upper")
  u_c = context:get_option("unicode_comment")
  d_c = context:get_option("debug_comment")
  return u_c or d_c
end

-- local function comment_filter_unicode_debug(inp,env)
local function filter(inp, env)
  local engine = env.engine
  local context = engine.context
  local c_input = context.input
  local exclude_seg = seg_1 or seg_2 or seg_3
  check_schema(c_input)
  -- local tab={}

--------------------------------------------
---- 寫法一

  -- if not u_c and d_c then
  --   for cand in inp:iter() do
  --     local debugcomment = debugcomment(cand)
  --     local cand = UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. cand.comment)
  --     yield(cand)
  --   end
  -- elseif u_c and not d_c then
  --   for cand in inp:iter() do
  --     if utf8.len(cand.text) == 1 and not exclude_seg and check_input then
  --       local utf8comment = utf8comment(cand.text)
  --       -- local cand = change_comment(cand, utf8comment .. cand.comment)
  --       -- local cand = ShadowCandidate(cand, "Shad", cand.text, utf8comment .. cand.comment)
  --       local cand = UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, utf8comment .. cand.comment)
  --       yield(cand)
  --     else
  --       yield(cand)
  --     end
  --   end
  -- elseif u_c and d_c then
  --   for cand in inp:iter() do
  --     local debugcomment = debugcomment(cand)
  --     if utf8.len(cand.text) == 1 and not exclude_seg and check_input then
  --       local utf8comment = utf8comment(cand.text)
  --       local cand = UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. utf8comment .. cand.comment )
  --       yield(cand)
  --     else
  --       local cand = UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. cand.comment)
  --       yield(cand)
  --     end
  --   end
  -- end

--------------------------------------------
---- 寫法二

  -- for cand in inp:iter() do
  --   local utf8comment = utf8comment(cand.text)
  --   local debugcomment = debugcomment(cand)
  --   -- local utf8comment = "  U+" .. string.format("%X",utf8.codepoint(cand.text)) .. "  ( " .. url_encode(cand.text) .. " ）"
  --   -- local debugcomment = "【"..cand:get_dynamic_type()..":"..cand.type.."| $ "..string.format("%6.6f", cand.quality).." | ‸ "..cand.start.."~"..cand._end.." 】"
  --   -- -- local debugcomment = "【 "..cand:get_dynamic_type().."|"..cand.type.."┃q: "..string.format("%6.6f", cand.quality).."┃s: "..cand.start.." e: "..cand._end.." 】"

  --   if not u_c and d_c then
  --     local cand = UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. cand.comment)
  --     yield(cand)

  --   elseif u_c and not d_c and utf8.len(cand.text) == 1 and not exclude_seg and check_input then
  --     -- local cand = change_comment(cand, utf8comment .. cand.comment)
  --     -- local cand = ShadowCandidate(cand, "Shad", cand.text, utf8comment .. cand.comment)
  --     local cand = UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, utf8comment .. cand.comment)
  --     yield(cand)

  --     -- if tab[cand.text] then
  --     --   tab[cand.text]:append(cand)
  --     -- else
  --     --   tab[cand.text] = cand:to_uniquified_candidate("uniquified", cand.text, cand.type .. utf8comment .. cand.comment)
  --     --   yield(tab[cand.text])
  --     -- end

  --   elseif u_c and d_c then
  --     if utf8.len(cand.text) == 1 and not exclude_seg and check_input then
  --       local cand = UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. utf8comment .. cand.comment )
  --       yield(cand)
  --     else
  --       local cand = UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. cand.comment)
  --       yield(cand)
  --     end

  --   -- if u_c and utf8.len(cand.text) == 1 and cand.type == "simplified" then
  --   --   local newpreedit = cand.preedit
  --   --   local _end2 = context:get_preedit().sel_end
  --   --   local cand = Candidate("newcand", 0, _end2, cand.text, cand.type .. utf8comment .. cand.comment)
  --   --   yield(change_preedit(cand,newpreedit))
  --   --   yield(cand)
  --   -- elseif u_c and utf8.len(cand.text) == 1 then
  --   --   yield(change_comment(cand, cand.type .. utf8comment .. cand.comment ))
  --   --   -- yield(change_comment(cand, ""))  -- 測試用

  --   -- ----  u_c true 時
  --   -- -- yield( u_c and utf8.len(cand.text)==1 and change_comment(cand,"") or cand )

  --   else
  --     cand

  --   end
  -- end

--------------------------------------------
---- 寫法三

  for cand in inp:iter() do
    local utf8comment = utf8comment(cand.text)
    local debugcomment = debugcomment(cand)
    yield(-- not u_c and d_c
          -- and UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. cand.comment) or
          u_c and not d_c and utf8.len(cand.text) == 1 and not exclude_seg and check_input
          and UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, utf8comment .. cand.comment) or
          u_c and d_c and utf8.len(cand.text) == 1 and not exclude_seg and check_input
          and UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. utf8comment .. cand.comment) or
          -- u_c and d_c
          d_c
          and UniquifiedCandidate(cand, "Uniq_Unicode_debug", cand.text, debugcomment .. cand.comment) or
          cand
          )
  end

--------------------------------------------

end


----------------
---- 他人方法

-- local function C2U(char)
--     local unicode_d = utf8.codepoint(char)
--     local unicode_h = string.format('%x', unicode_d)
--     --DEBUG
-- --    sm("C2U char="..char)
-- --    sm("C2U d="..unicode_d)
-- --    sm("C2U h="..unicode_h)
--     return unicode_h
-- end

-- local function filter(input, env)
--     local context = env.engine.context
--     local input_text = context.input
--     local udpf_switch = context:get_option("unicode_comment")
--     for cand in input:iter() do
--         if #input_text >= 1 and udpf_switch then
--             local char = cand.text
--             if utf8.len(char) == 1 then
--                 local unicode_h = C2U(char)
--                 --yield(Candidate(input_text, cand.start, cand._end, cand.text, cand.comment.."["..unicode_h.."]"))    --DEL
--                 cand:get_genuine().comment = cand.comment.."[U+"..unicode_h.."]"
--             end  --if
--         end  --if
--         yield(cand)
--     end  --for
-- end

----------------
-- return comment_filter_unicode_debug
return { init = init , func = filter , tags_match = tags_match }
-- return M
----------------