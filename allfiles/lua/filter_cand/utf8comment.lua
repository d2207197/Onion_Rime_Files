--- comment 

----------------------------------------------------------------------------------------
local url_encode = require("f_components/f_url_encode")
----------------------------------------------------------------------------------------

local function utf8comment(char)
  local unicode_d = utf8.codepoint(char)
  local unicode_h = string.format('%X', unicode_d)
  local urlcode = url_encode(char)
  return "  U+" .. unicode_h .. " (" .. urlcode .. "）"
end

return utf8comment