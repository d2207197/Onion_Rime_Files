--- @@ mix_apc_s2rm_3 注音mixin 3
--[[
（bo_mixin3）
合併 ascii_punct_change 和 s2r_mixin3，增進效能。
--]]

-- local function mix_apc_s2rm_3(key, env)
local function processor(key, env)
  local engine = env.engine
  local context = engine.context
  local input_3 = context.input
  local orig_3 = context:get_commit_text()
  local o_ascii_punct = context:get_option("ascii_punct")
  local o_ascii_mode = context:get_option("ascii_mode")
  -- local check_i1 = string.match(input_3, "[@:]")
  -- local check_i2 = string.match(input_3, "^'/[';a-z0-9.,/-]*$")
  -- local check_i3 = string.match(input_3, "[-,./;a-z125890][]['3467%s]'/[';a-z0-9.,/-]*$")
  -- local check_i4 = string.match(input_3, "=[0-9]'/[';a-z0-9.,/-]*$")
  --                 -- string.match(input_3, "=[][]'/[';a-z0-9.,/-]*$")
  -- local check_i5 = string.match(input_3, "=[][][][]?'/[';a-z0-9.,/-]*$")
  -- local check_i6 = string.match(input_3, "=[-,.;=`]'/[';a-z0-9.,/-]*$")
  -- local check_i7 = string.match(input_3, "=[-,.;'=`][-,.;'=`]'/[';a-z0-9.,/-]*$")
  -- local check_i8 = string.match(input_3, "=[-125890;,./]$")
  -- local check_i9 = string.match(input_3, "=[-;,./][-;,./]$")
  -- local check_i10 = string.match(input_3, "==[90]$")
  local check_i = string.match(input_3, "[@:]") or
                  string.match(input_3, "^'/[';a-z0-9.,/-]*$") or
                  string.match(input_3, "[-,./;a-z125890][]['3467%s]'/[';a-z0-9.,/-]*$") or
                  string.match(input_3, "=[0-9]'/[';a-z0-9.,/-]*$") or
                  -- string.match(input_3, "=[][]'/[';a-z0-9.,/-]*$") or
                  string.match(input_3, "=[][][][]?'/[';a-z0-9.,/-]*$") or
                  string.match(input_3, "=[-,.;=`]'/[';a-z0-9.,/-]*$") or
                  string.match(input_3, "=[-,.;'=`][-,.;'=`]'/[';a-z0-9.,/-]*$") or
                  string.match(input_3, "=[-125890;,./]$") or
                  string.match(input_3, "=[-;,./][-;,./]$") or
                  string.match(input_3, "==[90]$")

  if o_ascii_mode then
    return 2

  elseif key:repr() == "space" and context:is_composing() then
  -- elseif key:repr() == "space" and context:has_menu() then
    if check_i then
    -- if check_i1 or check_i2 or check_i3 or check_i4 or check_i5 or check_i6 or check_i7 or check_i8 or check_i9 or check_i10 then
    -- if ( string.match(input_3, "[@:]") or string.match(input_3, "^'/[';a-z0-9.,/-]*$") or string.match(input_3, "[-,./;a-z125890][]['3467%s]'/[';a-z0-9.,/-]*$") or string.match(input_3, "=[0-9]'/[';a-z0-9.,/-]*$") or string.match(input_3, "=[][]'/[';a-z0-9.,/-]*$") or string.match(input_3, "=[][][][]'/[';a-z0-9.,/-]*$") or string.match(input_3, "=[-,.;=`]'/[';a-z0-9.,/-]*$") or string.match(input_3, "=[-,.;'=`][-,.;'=`]'/[';a-z0-9.,/-]*$") or string.match(input_3, "=[-125890;,./]$") or string.match(input_3, "=[-;,./][-;,./]$") or string.match(input_3, "==[90]$") ) then  --or string.match(input_3, "==[,.]{2}$")
    -- if ( string.match(input_3, "[@:]") or string.match(input_3, "^'/[';a-z0-9./-]*$") or string.match(input_3, "[-,./;a-z125890][]['3467%s]'/[';a-z0-9./-]*$") or string.match(input_3, "=[0-9]'/[';a-z0-9./-]*$") or string.match(input_3, "=[][]'/[';a-z0-9./-]*$") or string.match(input_3, "=[][][][]'/[';a-z0-9./-]*$") or string.match(input_3, "=[-,.;=`]'/[';a-z0-9./-]*$") or string.match(input_3, "=[-,.;'=`][-,.;'=`]'/[';a-z0-9./-]*$") or string.match(input_3, "=[-125890;,./]$") or string.match(input_3, "=[-;,./][-;,./]$") or string.match(input_3, "==[90]$") or string.match(input_3, "==[,][,]?$") or string.match(input_3, "==[.][.]?$") ) then
    -- -- 「全，非精簡」 if ( string.match(input_3, "[@:]") or string.match(input_3, "^'/[';a-z0-9./-]*$") or string.match(input_3, "[-,./;a-z125890][]['3467%s]'/[';a-z0-9./-]*$") or string.match(input_3, "=[0-9]'/[';a-z0-9./-]*$") or string.match(input_3, "=[][]'/[';a-z0-9./-]*$") or string.match(input_3, "=[][][][]'/[';a-z0-9./-]*$") or string.match(input_3, "=[-,.;=`]'/[';a-z0-9./-]*$") or string.match(input_3, "=[-,.;'=`][-,.;'=`]'/[';a-z0-9./-]*$") or string.match(input_3, "=[-125890;,./]$") or string.match(input_3, "=[-][-]$") or string.match(input_3, "=[;][;]$") or string.match(input_3, "=[,][,]$") or string.match(input_3, "=[.][.]$") or string.match(input_3, "=[/][/]$") or string.match(input_3, "==[90]$") or string.match(input_3, "==[,][,]?$") or string.match(input_3, "==[.][.]?$") ) then
      engine:commit_text(orig_3)
      context:clear()
      return 1 -- kAccepted
    end

  elseif o_ascii_punct then
    if key:repr() == "Shift+less" then
      if context:is_composing() then
        engine:commit_text( orig_3 .. "," )
      else
        engine:commit_text( "," )
      end
      context:clear()
      return 1 -- kAccepted
    elseif key:repr() == "Shift+greater" then
      if context:is_composing() then
        engine:commit_text( orig_3 .. "." )
      else
        engine:commit_text( "." )
      end
      context:clear()
      return 1 -- kAccepted
    end

  end

  return 2 -- kNoop
end

-- return mix_apc_s2rm_3
return { func = processor }