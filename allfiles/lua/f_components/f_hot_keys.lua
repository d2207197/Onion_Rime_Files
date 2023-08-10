--[[
按鍵說明
--]]

local bo_mixin_plus_table = {
    { "【注音 mixin 和 plus 系列】", "🄋" }
  , { "　＊中/英", "➀" }
  , { "　　［shift］+［space］變換中英（未打字時）", "➁" }
  , { "　　［control］+［shift］+［2］變換中英", "➂" }
  , { "　　［control］+［ ，］切換英文", "➃" }
  , { "　　［control］+［shift］+［ ，］切換中文", "➄" }

  , { "　＊打字輸入", "➅" }
  , { "　• 刪除：", "➆" }
  , { "　　［esc］消除未上屏注音", "➇" }
  , { "　　［delete/BackSpace］刪除單個字全部注音", "➈" }
  , { "　［ \\ ］刪除一個注音符號（選單出現時）", "➀🄋" }
  , { "　［shift］+［delete/BackSpace］刪除一個注音符號", "➀➀" }
  , { "• 特殊輸入：", "➀➁" }
  , { "　［shift］+［return/Enter］直出輸入所對應的英文、數字、符號", "➀➂" }
  , { "　［control］+［return/Enter］輸出顯示之編碼，如注音符號", "➀➃" }
  , { "　［shift］+［control］+［return/Enter］輸出選項註釋", "➀➄" }
  , { "• 游標移位：", "➀➅" }
  , { "　［right/left］游標向左右一整個字（打字時）", "➀➆" }
  , { "　［shift］+［right/left］游標向左右一個注音", "➀➇" }
  , { "　［up］游標向左一個注音（打字時）", "➀➈" }
  , { "　［tab］和［shift］+［tab］首節（下一節）和上一節", "➁🄋" }
  , { "　（↑ 首個中文字，好用可善用！）", "➁➀" }
  , { "　［tab］跳回游標切分狀態（選字時）", "➁➁" }
  , { "• 翻頁：", "➁➂" }
  , { "　［right/left］選字單翻頁（選字時）", "➁➃" }
  , { "　［shift］+［up/down］選字單翻頁", "➁➄" }
  , { "　［shift］+［C］和［shift］+［space］選字單翻頁（輸入時）", "➁➅" }
  , { "　［shift］+［I］和［shift］+［K］選字單翻頁（輸入時）", "➁➆" }
  , { "• 選字：", "➁➇" }
  , { "　［shift］+［QAZWSX］選字（左邊）", "➁➈" }
  , { "　［shift］+［YHNUJM］選字（右邊）", "➂🄋" }
  , { "　［control］+［123456］選字！（Mac會鍵位衝突！）", "➂➀" }
  , { "• 刪除自動記憶：", "➂➁" }
  , { "　［fn］+［shift］+［BackSpace］選詞時，刪除自動記錄詞", "➂➂" }
  , { "　（↑ Mac）", "➂➃" }
  , { "　［shift/control］+［BackSpace］選詞時，刪除自動記錄詞", "➂➄" }
  , { "　（↑ Win）", "➂➅" }
  , { "　［shift］+［Delete］Mac 外接鍵盤沒 fn 鍵，刪除自動記錄詞", "➂➆" }
  , { "　（↑ 注意該 Delete 非 BackSpace）", "➂➇" }

  , { "＊設置選單", "➂➈" }
  , { "　［control］+［ ` ］開啟方案選單（設置）", "➃🄋" }
  , { "　［control］+［shift］+［ ` ］開啟方案選單（設置）", "➃➀" }

  , { "＊快捷鍵（上排/變換）", "➃➁" }
  , { "　［control］+［shift］+［1］變換方案", "➃➂" }
  , { "　［control］+［shift］+［2］變換中英", "➃➃" }
  , { "　［control］+［shift］+［3］變換全半形", "➃➄" }
  , { "　［control］+［shift］+［4］變換標點全半形", "➃➅" }
  , { "　［control］+［shift］+［5］變換繁簡體", "➃➆" }
  , { "　［control］+［shift］+［6］變換中文字符範圍", "➃➇" }
  , { "　［control］+［shift］+［7］變換附加 Emoji 有無", "➃➈" }
  , { "　［control］+［shift］+［8］變換外語和符號註釋有無", "➄🄋" }
  , { "　［control］+［shift］+［9］變換《Easy》英文排序", "➄➀" }

  , { "＊快捷鍵（下排/指定）", "➄➁" }
  , { "　　--", "➄➂" }
  , { "　［control］+［ ，］切換英文", "➄➃" }
  , { "　［control］+［shift］+［ ，］切換中文", "➄➄" }
  , { "　　--", "➄➅" }
  , { "　［control］+［ ．］切換全形（全角）", "➄➆" }
  , { "　［control］+［shift］+［ ．］切換半形（半角）", "➄➇" }
  , { "　　--", "➄➈" }
  , { "　［control］+［ ／ ］切換標點半形", "➅🄋" }
  , { "　［control］+［shift］+［ ／ ］切換標點全形（原注音形式）", "➅➀" }
  , { "　　--", "➅➁" }
  , { "　［control］+［ ；］切換簡體轉換", "➅➂" }
  , { "　［control］+［shift］+［ ；］切換不轉換簡體", "➅➃" }
  , { "　　--", "➅➄" }
  , { "　［control］+［ ' ］切換中文字符範圍為完整，不精簡", "➅➅" }
  , { "　［control］+［shift］+［ ' ］切換中文其字符範圍為精簡", "➅➆" }
  , { "　　--", "➅➇" }
  , { "　［control］+［ [ ］切換附加 Emoji 為無", "➅➈" }
  , { "　［control］+［shift］+［ [ ］切換附加 Emoji為有", "➆🄋" }
  , { "　　--", "➆➀" }
  , { "　［control］+［ ] ］切換外語和符號註釋為無", "➆➁" }
  , { "　［control］+［shift］+［ ] ］切換外語和符號註釋為有", "➆➂" }
  , { "　（↑ 例：æ 〔KK, DJ, IPA〕、ㄏ 〔注音〕）", "➆➃" }
  , { "　（↑ 直按和「 = 」「符號」之標點符號註釋無法關閉）", "➆➄" }
  , { "　　--", "➆➅" }
  , { "　［control］+［ = ］切換《Easy》英文排序為序排", "➆➆" }
  , { "　［control］+［shift］+［ = ］切換《Easy》英文排序為個排", "➆➇" }
  , { "　（↑ 個排：按字母個數、序排：按 a~z）", "➆➈" }
  , { "　　--", "➇🄋" }

  -- , { "　＊基本功能鍵", "🄋" }
  -- , { "＊洋蔥版功能鍵", "➀➇" }
  -- , { "　（洋蔥注音 plus 和 mixin 版限定，純注音版該鍵位為分節）", "➁🄋" }
  -- , { "　（［ QAZWSX ］和［ YHNUJM ］在鍵盤上為同樣形狀區塊，只是左邊移到右邊。）", "➃➂" }
  -- , { "　（［ QAZWSX ］方便單手選字；［ YHNUJM ］方便雙手選字。）", "➃➃" }
  -- , { "　（須使用內附的 default.custom.yaml 檔）", "➂➇" }
  -- , { "　（↑ 使用內附的 default.custom.yaml 檔才有效）", "➀➃" }
  -- , { "　預設功能快捷鍵多在上排，增設下排手順較好位置。", "➃➅" }
  -- , { "　以下快捷鍵切換不循環，使所切換之項目能完全肯定，含［ shift ］為初始設定。", "➃➆" }
  -- , { "　欲循環切換可使用［ control ］ +［ shift ］+［ 1～9 ］", "➃➇" }
  -- , { "• 以下八個快捷鍵，須使用內附的 default.custom.yaml 檔：", "➃➈" }
  -- , { "＊翻頁和選字", "➀🄋" }
  -- , { "　（↑ Rime 官方預設為［4］）", "➃➅" }
  -- , { "　　（↑ 整個字的注音，非單一個注音符號）", "➈" }

  }

local bo_double_table = {
    { "【注音雙拼】", "🄋" }
  , { "　待補", "➀" }
  }

local array30_table = {
    { "【行列３０】", "🄋" }
  , { "　待補", "➀" }
  }

local ocm_table = {
    { "【形碼方案】", "🄋" }
  , { "　待補", "➀" }
  }

local unknown_table = {
    { "【不明方案】", "🄋" }
  , { "　待補", "➀" }
  }

local function hotkeys(name_id)
  local bo = string.match( name_id, "^bo_mixin") or string.match( name_id, "^bopomo_onionplus")
  local bo_double = string.match( name_id, "^bopomo_onion_double")
  local array30 = string.match( name_id, "array30$")
  local ocm = string.match( name_id, "^ocm_") or string.match( name_id, "^dif1")
  if bo then
    hotkeys_table = bo_mixin_plus_table
  elseif bo_double then
    hotkeys_table = bo_double_table
  elseif array30 then
    hotkeys_table = array30_table
  elseif ocm then
    hotkeys_table = ocm_table
  else
    hotkeys_table = unknown_table
  end
  return hotkeys_table
end

return hotkeys