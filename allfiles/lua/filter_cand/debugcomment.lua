--- comment 

----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------

local function debugcomment(cand)
  local dt = cand:get_dynamic_type()
  local t = cand.type
  local q = cand.quality
  local s = cand.start
  local e = cand._end
  return "【"..dt..":"..t.."| $ "..string.format("%6.6f", q).." | ‸ "..s.."~"..e.." 】"
end

return debugcomment