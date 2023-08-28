--[[
可快捷開啟之 檔案/程式/網址 列表
只限開頭輸入「前綴」+「op」+「開啟碼」（防止輸入長碼時，誤按整個長碼跳掉）
開啟碼為一至兩碼英文
--]]

local pattern_list = {
  ["o"] = "https://github.com/oniondelta/Onion_Rime_Files",
  ["r"] = "https://github.com/rime",
  -- ["開啟碼"] = "檔案or程式or網址位置",
  -- ["c"] = "/System/Applications/Calculator.app",  -- mac專用：計算機
  -- ["d"] = "/System/Applications/Dictionary.app",  -- mac專用：字典
  -- ["tt"] = "/System/Applications/TextEdit.app",  -- mac專用：文字編輯
 }

return pattern_list