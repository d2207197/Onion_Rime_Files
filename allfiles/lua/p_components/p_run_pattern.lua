--[[
可快捷開啟（join/joint）檔案/程式/網址 列表。
只限起始輸入「前綴」「j」「開啟碼」「上屏鍵」。開啟碼限英文[a-z]+。
（限起始輸入：防止輸入長碼，未上屏後接 Lua 功能時，誤按整個長碼跳掉）
設定「開啟碼」規律（非強制性設定）：「f」為開啟檔案、「w」為開啟網址、「a」為開啟 app。
「t」「c」兩鍵位已使用。
修改後需「重新部署」才可生效。
--]]

local run_pattern = {
  -- ["開啟碼"] = "檔案or程式or網址位置",
--------------------------------------------------------------------------
--------------------------------------------------------------------------
  ["r"] = { name = " Rime 官方 GitHub ", open = "https://github.com/rime" },
  ["o"] = { name = " Onion 洋蔥 GitHub ", open = "https://github.com/oniondelta/Onion_Rime_Files" },
  ["ow"] = { name = " Onion 洋蔥 GitHub Wiki ", open = "https://github.com/oniondelta/Onion_Rime_Files/wiki" },
--------------------------------------------------------------------------
--------------------------------------------------------------------------
  -- ["ac"] = { name = "計算機", open = "/System/Applications/Calculator.app" },         -- mac 專用：計算機
  -- ["at"] = { name = "文字編輯器", open = "/System/Applications/TextEdit.app" },        -- mac 專用：文字編輯
  -- ["ad"] = { name = "字典", open = "/System/Applications/Dictionary.app" },           -- mac 專用：字典
  -- ["ac"] = { name = "CotEditor", open = "/Applications/CotEditor.app" },             -- mac 專用：一般 app
  -- ["as"] = { name = "Sublime", open = "/Applications/Sublime' 'Text.app" },          -- mac 專用：路徑中空格用「' '」標示
  -- ["as"] = { name = "Sublime", open = "/Applications/Sublime\\ Text.app" },          -- mac 專用：路徑中空格用「\\ 」標示
--------------------------------------------------------------------------
  -- ["r"] = { name = " Rime 官方 GitHub ", open = "-a '/Applications/Firefox.app' https://github.com/rime" },                               -- mac 專用：指定程式開啟
  -- ["o"] = { name = " Onion 洋蔥 GitHub ", open = "-a '/Applications/Firefox.app' https://github.com/oniondelta/Onion_Rime_Files" },        -- mac 專用：指定程式開啟
  -- ["ow"] = { name = " Onion 洋蔥 GitHub Wiki ", open = "-a '/Applications/Firefox.app' https://github.com/oniondelta/Onion_Rime_Files/wiki" },  -- mac 專用：指定程式開啟
--------------------------------------------------------------------------
  -- ["ft"] = { name = " TEST ", open = "-a '/Applications/CotEditor.app' /Users/使用者名稱/test.txt",     -- mac 專用：指定程式開啟
  -- ["ft"] = { name = " TEST ", open = "-a '/Applications/Sublime Text.app' /Users/使用者名稱/test.txt",  -- mac 專用：指定程式開啟（此處程式名稱空格不用更動）
--------------------------------------------------------------------------
--------------------------------------------------------------------------
  -- ["ac"] = { name = "計算機", open = [["C:\WINDOWS\system32\calc.exe"]] },              -- win 專用：計算機
  -- ["an"] = { name = "記事本", open = [["C:\WINDOWS\system32\notepad.exe"]] },           -- win 專用：記事本
  -- ["ap"] = { name = "小畫家", open = [["C:\WINDOWS\system32\mspaint.exe"]] },           -- win 專用：小畫家
  -- ["aa"] = { name = " Notepad++ ", open = [["C:\Program Files\Notepad++\notepad++.exe"]] },  -- win 專用：路徑中空格不用更動
--------------------------------------------------------------------------
--------------------------------------------------------------------------
  -- ["r"] = "https://github.com/rime",                             -- 測試用
  -- ["x"] = { name = "缺省測試" },                                  -- 測試用
  -- ["y"] = { name = "油管", open = "https://www.youtube.com/" },   -- 測試用
--------------------------------------------------------------------------
--------------------------------------------------------------------------
 }

-- print(run_pattern['wr'].name)
-- print(run_pattern['wr'].open)
-- print(run_pattern['wd'].name)
-- print(run_pattern['wd'].open)

-- print(run_pattern['no_item'].open)  -->報錯！！！
-- print(run_pattern['no_item'])       -->nil
-- print(run_pattern['wr'].no_item)    -->nil
-- print(run_pattern[nil])             -->nil

return run_pattern