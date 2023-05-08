--- 修改 preedit 樣式
-- 可用 Translation(revise_preedit_by_os, inp, g_op) 導出

----------------------------------------------------------------------------------------

local change_preedit = require("filter_cand/change_preedit")

local get_os_name = require("f_components/f_get_os_name")

----------------------------------------------------------------------------------------

local function revise_preedit_by_os(model, cand, preedit)

  local os_name = get_os_name() or ""
  if os_name == "Mac" then
    os_name = 1
  elseif os_name == "Windows" then
    os_name = 2
  elseif os_name == "Linux" then
    os_name = 3
  else
    os_name = 0
  end

  -- if model == 2 then
  --   preedit = string.gsub(preedit, "\n", "")
  --   preedit = string.gsub(preedit, "⁞", "@")
  --   preedit = string.gsub(preedit, "　", " ")
  --   preedit = string.gsub(preedit, "([^ ]+) ([^ ]+)$", "%2‹%1›")
  --   n = 14
  --   while string.match(preedit, "%s") and n>1 do
  --     preedit = string.gsub(preedit, "([^ ]+) ([^ ]+)@([^@]+)$", "%2‹%1›%3")
  --     n = n-1
  --   end
  --   -- for i = 1,14 do
  --   --   preedit = string.gsub(preedit, "([^ ]+) ([^ ]+)@([^@]+)$", "%2‹%1›%3")
  --   -- end
  -- elseif model == 3 and os_name == 1 then
  --   preedit = string.gsub(preedit, "　", " ")
  --   preedit = string.gsub(preedit, "^([^\n]+) \n([^\n]+)", "%2　%1")

  if model == 2 then
    preedit = string.gsub(preedit, "⁞", "@")
    preedit = string.gsub(preedit, "　", " ")
    n = 14
    while string.match(preedit, " ") and n>1 do
      preedit = string.gsub(preedit, "^([^@]+)@([^ ]+) ([^ ]+)", "%1‹%3›%2")
      n = n-1
    end
    preedit = string.gsub(preedit, " ([^ ]+)$", "‹%1›")
  elseif model == 3 and os_name == 1 then
    preedit = string.gsub(preedit, "^(.+)　(.+)", "%2　\n%1")
    preedit = string.gsub(preedit, " ", "　")
  end

  local cand = change_preedit(cand, preedit)

  return cand
end


local function output(tran, g_op)
  for cand in tran:iter() do
    local cand = revise_preedit_by_os(g_op, cand, cand.preedit)
    yield(cand)
  end
end


return output