--- comment 附加 Unicode 和 url_encode 編碼

----------------------------------------------------------------------------------------
local url_encode = require("f_components/f_url_encode")
----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
---- 寫法一

local function utf8_comment(char)
  if utf8.len(char) == 1 then
    local unicode_d = utf8.codepoint(char)
    local unicode_h = string.format('%X', unicode_d)
    local urlcode = url_encode(char)
    comment = "  U+" .. unicode_h .. " (" .. urlcode .. "）" or ""
  else
    comment = ""
  end
  return comment
end

----------------------------------------------------------------------------------------
---- 寫法二

-- local function utf8_comment(char)
--   local comment = utf8.len(char) == 1 and "  U+" .. string.format("%X",utf8.codepoint(char)) .. "  ( " .. url_encode(char) .. " ）" or ""
--   return comment
-- end

----------------------------------------------------------------------------------------
---- 寫法三

-- local function utf8_comment(char)
--   return utf8.len(char) == 1 and "  U+" .. string.format("%X",utf8.codepoint(char)) .. "  ( " .. url_encode(char) .. " ）" or ""
-- end

----------------------------------------------------------------------------------------
---- 舊版沒限定字數

-- local function utf8_comment(char)
--   local unicode_d = utf8.codepoint(char)
--   local unicode_h = string.format('%X', unicode_d)
--   local urlcode = url_encode(char)
--   return comment = "  U+" .. unicode_h .. " (" .. urlcode .. "）" or ""
-- end

----------------------------------------------------------------------------------------

return utf8_comment