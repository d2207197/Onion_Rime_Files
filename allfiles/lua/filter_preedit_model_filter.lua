--- @@ preedit_model_filter
--[[
（）
如同
--]]

----------------------------------------------------------------------------------------

local change_preedit = require("filter_cand/change_preedit")

-- local get_os_name = require("f_components/f_get_os_name")

----------------------------------------------------------------------------------------

local function revise_preedit_by_os(model, cand, preedit)
-- local function revise_preedit_by_os(os_name, cand, preedit, model)

  -- if os_name ~= 1 and os_name ~= 3 then
  -- if os_name == 2 then
  -- if os_name ~= 1 then
  -- if os_name == 1 then  -- 測試用

  -- if os_name == 1 and model == 1 then
  --   model = 2
  -- end

  if model == 2 then

    preedit = string.gsub(preedit, "⁞", "@")
    preedit = string.gsub(preedit, "　", " ")
    n = 14
    while string.match(preedit, "%s") and n>1 do
      preedit = string.gsub(preedit, "^([^@]+)@([^ ]+) ([^ ]+)", "%1‹%3›%2")
      n = n-1
    end
    preedit = string.gsub(preedit, " ([^ ]+)$", "‹%1›")

    -- preedit = string.gsub(preedit, "\n", "")
    -- preedit = string.gsub(preedit, "⁞", "@")
    -- preedit = string.gsub(preedit, "　", " ")
    -- preedit = string.gsub(preedit, "([^ ]+) ([^ ]+)$", "%2‹%1›")
    -- n = 14
    -- while string.match(preedit, "%s") and n>1 do
    --   preedit = string.gsub(preedit, "([^ ]+) ([^ ]+)@([^@]+)$", "%2‹%1›%3")
    --   n = n-1
    -- end
    -- -- for i = 1,14 do
    -- --   preedit = string.gsub(preedit, "([^ ]+) ([^ ]+)@([^@]+)$", "%2‹%1›%3")
    -- -- end

  elseif model == 3 then

    -- preedit = string.gsub(preedit, "　", " ")
    -- preedit = string.gsub(preedit, "^([^\n]+) \n([^\n]+)", "%2　%1")

    preedit = string.gsub(preedit, "^(.+)　(.+)", "%2　\n%1")
    preedit = string.gsub(preedit, " ", "　")

  end

  local cand = change_preedit(cand, preedit)

  return cand
end


-- -- local M={}
-- local function init(env)
-- -- function M.init(env)
--   -- local os_name = get_os_name() or ""
--   -- if os_name == "Mac" then
--   --   env.os_name = 1
--   -- elseif os_name == "Windows" then
--   --   env.os_name = 2
--   -- elseif os_name == "Linux" then
--   --   env.os_name = 3
--   -- else
--   --   env.os_name = 0
--   -- end
-- end


-- function M.fini(env)
-- end


-- local function preedit_model_filter(inp, env)
local function filter(inp, env)
-- function M.func(inp,env)
  local engine = env.engine
  local context = engine.context
  local p_1 = context:get_option("preedit_1")
  local p_2 = context:get_option("preedit_2")
  local p_3 = context:get_option("preedit_3")

  if p_1 then
    g_op = 1
  elseif p_2 then
    g_op = 2
  elseif p_3 then
    g_op = 3
  else
    g_op = 0
  end

  for cand in inp:iter() do
    local cand = revise_preedit_by_os(g_op, cand, cand.preedit) --, p1
    -- local cand = revise_preedit_by_os(env.os_name, cand, cand.preedit, g_op) --, p1
    yield(cand)
  end

end


-- return preedit_model_filter
return { func = filter }
-- return { init = init, func = filter }
-- return M