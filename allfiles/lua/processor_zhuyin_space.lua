
-- local function status(ctx)
--     local stat = metatable()
--     local comp = ctx.composition
--     stat.always = true
--     stat.composing = ctx:is_composing()
--     stat.empty = not stat.composing
--     stat.has_menu = ctx:has_menu()
--     stat.paging = not comp:empty() and comp:back():has_tag("paging")
--     return stat
-- end

-- local function zhuyin_space(key,env)
local function processor(key, env)
  local engine = env.engine
  local context = engine.context
  local comp = context.composition
  local c_input = context.input
  local o_ascii_mode = context:get_option("ascii_mode")
  local g_c_t = context:get_commit_text()
  -- local g_s_t = context:get_script_text()

  -- local s = status(context)
  --- 不要使用以下作為選擇項和未選擇項計算，太困難了，因 preedit 除注音字節，還包含不確定的分節空白。
  -- local start = context:get_preedit().sel_start
  -- local _end = context:get_preedit().sel_end
  -- local es = _end - start
  -- local caret_pos = context.caret_pos

  if o_ascii_mode then
    return 2

  elseif comp:empty() then
    return 2

  elseif not comp:back():has_tag("reverse2_lookup") and not comp:back():has_tag("all_bpm") then
    return 2

  elseif not context:has_menu() then
  -- elseif not context:is_composing() then  --無法空碼清屏
    return 2

  elseif key:repr() ~= "space" and key:repr() ~= "Return" and key:repr() ~= "KP_Enter" then
    return 2

  --- 以下修正：附加方案鍵盤範圍大於主方案時，選字時出現的 bug。
  elseif comp:back():has_tag("paging") then

    --- 先上屏 paging 時選擇的選項
    -- local segment = comp:back()
    -- local selected_candidate_index = segment.selected_index
    -- context:select(selected_candidate_index)
    local cand = context:get_selected_candidate()
    engine:commit_text(cand.text)
    -- engine:commit_text(cand.text..start.." ".._end.." "..#c_input.." "..caret_pos )  --測試各個位置數值用

    --- 計算末尾殘留的非中文字元數（未被選擇的 cand.input 字元數）
    local nn = #string.gsub(g_c_t, "[^.,;/ %w-]", "")  -- 刪除中文編碼後，計算字數。
    -- context:confirm_current_selection()
    -- context:refresh_non_confirmed_composition()

    --- 補前綴 "';" 或 "';'"，導入未上屏編碼，避免跳回主方案
    if nn==0 then
      context:clear()
    elseif comp:back():has_tag("reverse2_lookup") then
      context.input = "';" .. string.sub(c_input, -nn)
    elseif comp:back():has_tag("all_bpm") then
      context.input = "';'" .. string.sub(c_input, -nn)
    end
    return 1

  --- 如果末尾為聲調則跳掉，如空白鍵，則 Rime 上屏，非 lua 作用。
  elseif string.match(c_input, "[ 3467]$") then
    return 2

  --- 補掛接反查注音不能使用空白當作一聲
  elseif key:repr() == "space" then
  -- elseif key:repr() == "space" then
  -- elseif key:repr() == "space" and context:has_menu() then
    -- engine:commit_text(c_input .. "_")
    context.input = c_input .. " "
    -- context:clear()
    return 1

  end

  return 2
end


-- return zhuyin_space
return { func = processor }