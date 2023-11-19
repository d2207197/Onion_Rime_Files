--- comment 附加該選項 debug 訊息

local function debug_comment(cand)
  local dt = cand:get_dynamic_type()
  local t = cand.type
  local q = cand.quality
  local s = cand.start
  local e = cand._end
  return "【"..dt..":"..t.."| $ "..string.format("%6.6f", q).." | ‸ "..s.."~"..e.." 】"
end

return debug_comment