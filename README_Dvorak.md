# 洋蔥注音 Plus Dvorak 版 使用指南

本方案基於[洋蔥注音 Plus 版](https://github.com/oniondelta/Onion_Rime_Files)，
針對 **Dvorak 鍵盤 layout** 調整，讓使用者用 Dvorak 的物理鍵位輸入大千式注音。

## 安裝

將以下檔案放入 Rime 使用者目錄（macOS: `~/Library/Rime/`）：

- `bopomo_onionplus_dvorak.schema.yaml` — Dvorak 版方案定義
- `element_bopomo_dvorak.yaml` — Dvorak 版按鍵設定
- 其餘所有檔案與原版洋蔥注音 Plus 共用（字典、lua、opencc 等）

在 `default.custom.yaml` 中加入：

```yaml
patch:
  schema_list:
    - schema: bopomo_onionplus_dvorak
```

重新部署鼠鬚管即可使用。

---

## 給傳統注音使用者：Rime 注音的不同之處

如果你之前用的是 Windows 微軟新注音或 macOS 內建注音，Rime 的注音邏輯**很不一樣**，比較像**手機注音**：

1. **整句輸入**：Rime 鼓勵你一次打完整句注音再選字，而不是打一個字選一個字。打越長，Rime 越能猜對。
2. **不會自動上屏**：打完注音後字會留在緩衝區（底線），你需要按 Enter 或空白確認上屏。
3. **選字方式不同**：不是用數字鍵 1-9 選字，而是用 Shift+字母鍵（本方案用右手 HTNS/MWVZ）。
4. **聲調可省略**：一聲（空白）通常可以省略直接打下一個字，Rime 會自動判斷。但加聲調可以提高準確度。
5. **標點直接打**：不需要像微軟注音那樣先按 `` ` `` 再選，直接按標點鍵就會輸出中文標點。
6. **中英切換**：習慣用 `Shift+空白` 切換中英文模式。

### 心態調整

- 不要害怕打長句，Rime 的長句預測比短句準確
- 遇到選字錯誤，先繼續打完再回頭修正，比逐字確認更快
- 如果常用的詞被記住了（Rime 會學習），以後會越打越準

---

## 注音鍵位對照

每個物理按鍵對應的注音符號與 QWERTY 大千式完全相同（依物理位置）：

```
QWERTY 鍵盤排列（大千式注音原版）：
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
│  q  │  w  │  e  │  r  │  t  │  y  │  u  │  i  │  o  │  p  │  -  │
│  ㄆ │  ㄊ │  ㄍ │  ㄐ │  ㄔ │  ㄒ │  ㄧ │  ㄛ │  ㄟ │  ㄣ │  ㄦ │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│  a  │  s  │  d  │  f  │  g  │  h  │  j  │  k  │  l  │  ;  │     │
│  ㄇ │  ㄋ │  ㄎ │  ㄑ │  ㄕ │  ㄗ │  ㄨ │  ㄜ │  ㄠ │  ㄤ │     │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│  z  │  x  │  c  │  v  │  b  │  n  │  m  │  ,  │  .  │  /  │     │
│  ㄈ │  ㄌ │  ㄏ │  ㄒ │  ㄖ │  ㄙ │  ㄩ │  ㄝ │  ㄡ │  ㄥ │     │
└─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘

Dvorak 鍵盤排列（同物理位置，同注音符號）：
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
│  '  │  ,  │  .  │  p  │  y  │  f  │  g  │  c  │  r  │  l  │  [  │
│  ㄆ │  ㄊ │  ㄍ │  ㄐ │  ㄔ │  ㄒ │  ㄧ │  ㄛ │  ㄟ │  ㄣ │  ㄦ │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│  a  │  o  │  e  │  u  │  i  │  d  │  h  │  t  │  n  │  s  │     │
│  ㄇ │  ㄋ │  ㄎ │  ㄑ │  ㄕ │  ㄗ │  ㄨ │  ㄜ │  ㄠ │  ㄤ │     │
├─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┼─────┤
│  ;  │  q  │  j  │  k  │  x  │  b  │  m  │  w  │  v  │  z  │     │
│  ㄈ │  ㄌ │  ㄏ │  ㄒ │  ㄖ │  ㄙ │  ㄩ │  ㄝ │  ㄡ │  ㄥ │     │
└─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘

數字列（兩者相同）：
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
│  1  │  2  │  3  │  4  │  5  │  6  │  7  │  8  │  9  │  0  │
│  ㄅ │  ㄉ │  ˇ  │  ˋ  │  ㄓ │  ˊ  │  ˙  │  ㄚ │  ㄞ │  ㄢ │
└─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘

聲調：空白鍵 = ˉ（一聲）、6 = ˊ、3 = ˇ、4 = ˋ、7 = ˙
```

---

## 選字

候選字選單出現後，共 8 個候選字，使用右手中排+下排選字：

```
┌──────────┬──────────┬──────────┬──────────┐
│ H = 候選1│ T = 候選2│ N = 候選3│ S = 候選4│
├──────────┼──────────┼──────────┼──────────┤
│ M = 候選5│ W = 候選6│ V = 候選7│ Z = 候選8│
└──────────┴──────────┴──────────┴──────────┘
```

- **Enter** = 確認第 1 候選
- **Shift+H** = 選第 1 候選（回頭重選字時，不需離開 Shift）
- **Tab** = 離開選字模式，回到編輯狀態
- 繼續輸入注音也會自動離開選字模式

> 空閒鍵（保留給未來功能）：右手 G, C, R, D, L, O ／左手 Y, U, I, X

---

## 操作流派一：Tab + 方向鍵（初學者推薦）

只需要 Tab、方向鍵、Enter、BackSpace，不需記 Shift 快捷鍵。

### 核心按鍵

| 按鍵 | 功能 |
|------|------|
| `Tab` / `Shift+Tab` | 往後（下一個字）/ 往前（上一個字）移動並選字 |
| `↑` `↓` | 在候選中選擇不同的字或詞 |
| `Enter` 或 `空白` | 確認選字 |
| `BackSpace` | 刪除一個字（整組注音） |
| `← →` | 也可在字之間移動（效果同 Tab / Shift+Tab） |

> **推薦以 Tab 為主**進行移動，因為在 Electron 類 app（Cursor、VSCode）中方向鍵可能穿透到 app。

### 基本輸入流程

```
1. 輸入整句注音（聲母 + 韻母 + 聲調，一聲可省略）
2. Rime 自動選字，結果顯示在緩衝區（底線）
3. 如果全對 → Enter 上屏
4. 如果有錯 → 用下面的方式修正
```

### 逐字確認（推薦）

打了一整句但有字選錯，從頭逐一確認：

```
1. 打完整句注音，Rime 自動選字
2. Tab                              ← 跳到第一個字，候選出現
3. Enter                            ← 第一個字對，確認
4. Tab                              ← 跳到第二個字
5. ↑ ↓                             ← 第二個字錯了，用上下選正確的
6. Enter                            ← 確認
7. Tab → Enter → Tab → ...         ← 繼續逐字確認到最後
```

### 跳到特定位置修正

只有某一個字錯，不想從頭確認：

```
1. Tab Tab Tab ...                  ← 連按 Tab 跳到要修改的字
   或 ← ← ← ...                   ← 用左鍵移動
2. ↑ ↓                             ← 選擇正確的字或詞
3. Enter                            ← 確認
4. Tab 或 →                        ← 繼續往後，或 Enter 直接上屏
```

### 修正注音（打錯注音字符）

打「ㄓㄨㄥ」想改成「ㄔㄨㄥ」（第一個注音打錯）：

```
1. Tab                              ← 離開選字模式（如果在選字中）
2. ↑ ↑ ↑                           ← 左移到錯的注音位置
3. Shift+BackSpace                  ← 刪掉一個注音字符
4. 輸入正確的注音
```

### 方向鍵完整參考

| 按鍵 | 移動模式（composing） | 選字模式（has_menu） |
|------|----------------------|---------------------|
| `←` | 回退一個字 | 上一頁 |
| `→` | 前進一個字 | 下一頁 |
| `↑` | 左移一個注音 | 上一個候選 |
| `↓` | — | 下一個候選（展開候選） |
| `Shift+←` | 左移一個注音 | — |
| `Shift+→` | 右移一個注音 | — |
| `Shift+↑` | — | 上一頁 |
| `Shift+↓` | — | 下一頁 |
| `Tab` | 下一節 | 回到移動模式 |
| `Shift+Tab` | 上一節 | — |

### 刪除

| 按鍵 | 效果 |
|------|------|
| `BackSpace` | 刪除整組注音（一個字的全部注音） |
| `Shift+BackSpace` | 刪除一個注音字符 |
| `\` | 刪除一個注音字符（選字狀態時） |
| `Fn+Shift+Delete` | 刪除記憶詞（先將游標移到該候選上） |

### 中英切換

按 `Shift+空白` 切換中文/英文模式。

---

## 操作流派二：Shift 快捷鍵（進階，手不離 home row）

左手按住 Shift，右手在字母區完成所有操作，不需要移動到方向鍵或 Enter。

### Shift+鍵 功能總覽

```
Dvorak 右手（左手按住 Shift）：       Dvorak 左手：
  F(fwd)  G(-)  C(-)  R(-)              P(注音文) ...
  D(---) [H=1  T=2  N=3  S=4]           A(ahead)  E(end)
  B(bwd) [M=5  W=6  V=7  Z=8]           Q(quit)   J(pgdn) K(pgup)
```

### 選字與移動

| 按鍵 | 功能 | 助記 |
|------|------|------|
| `Shift+H/T/N/S/M/W/V/Z` | 選字 1-8 | 右手中排+下排 |
| `Shift+F` | 右移一個字 | **F** = **f**orward |
| `Shift+B` | 左移回退一個字 | **B** = **b**ackward |

### 導航

| 按鍵 | 功能 | 助記 |
|------|------|------|
| `Shift+A` | Home（跳到開頭） | **A** = **a**head |
| `Shift+E` | End（跳到結尾） | Emacs C-**e** |
| `Shift+J` | Page Down（下一頁） | vi **j** = down |
| `Shift+K` | Page Up（上一頁） | vi **k** = up |

### 操作

| 按鍵 | 功能 | 助記 |
|------|------|------|
| `Shift+Q` | Escape（清除輸入） | **Q** = Quit |
| `Shift+P` | 上屏注音文（Control+Enter） | **P** = Phonetic |
| `Shift+Enter` | 上屏原始輸入（直出英文字元） | 鍵盤原生 |
| `Shift+Control+Enter` | 上屏候選字的註釋內容 | 鍵盤原生 |

### 常用 Shift 流操作範例

**打長句後修正中間某個字：**

```
1. 打完整句注音，Rime 自動選字
2. Shift+B Shift+B Shift+B     ← 左移 3 個字
3. Shift+H / Shift+T / ...     ← 從候選中選正確的字
4. Shift+F                      ← 右移，繼續確認後面的字
```

**前半段對、後半段要重打：**

```
1. Shift+B Shift+B              ← 左移到最後一個正確的字
2. Shift+H                      ← 確認該字
3. BackSpace BackSpace          ← 刪掉後面錯的注音
4. 重新輸入正確的注音
```

**從頭逐字確認（Shift+B 版）：**

```
1. Shift+A                      ← 跳到最前面
2. Shift+F                      ← 右移到第一個字，進入選字
3. Enter 或 Shift+H             ← 確認
4. Shift+F → 選字 → ...        ← 逐字往後確認
```

---

## 兩種流派比較

| | 方向鍵流派 | Shift 流派 |
|---|---|---|
| **適合** | 初學者、偶爾打中文 | 熟練者、大量打字 |
| **選字** | 方向鍵翻頁 + Enter | Shift+J/K 翻頁 + Shift 選字鍵 |
| **移動** | ↑ ← → 方向鍵 | Shift+F/B（字級）、Shift+A/E（首尾） |
| **刪除** | BackSpace | BackSpace（兩者相同） |
| **逐字確認** | Tab → Enter → Tab | Shift+A → Shift+F → 選字 |
| **優點** | 直覺，不用記 | 手不離 home row，速度快 |
| **缺點** | 手要移到方向鍵區 | 需要記 Shift 組合鍵 |

> 兩種流派可以混用。建議先從方向鍵流派開始，熟悉後逐漸加入 Shift 快捷鍵。

---

## 標點符號

Dvorak 版覆蓋了部分標點鍵，讓常用標點維持 QWERTY 的**物理位置**。

### 常用標點速查

```
頓號：  按 - （Enter 旁邊的鍵）
逗號：  按 < （Shift + ,）
句號：  按 > （Shift + .）
問號：  按 ? （Shift + /）
冒號：  按 : （Shift + ;）
左引號：按 / （QWERTY [ 的物理位置）
右引號：按 = （QWERTY ] 的物理位置）
```

### 完整標點對照

| 按鍵 | 輸出 | 說明 |
|:----:|:----:|------|
| `-` | 、 | **頓號**（Dvorak 覆蓋，同 QWERTY `'` 物理位置） |
| `/` | 「 | **左引號**（Dvorak 覆蓋，同 QWERTY `[` 物理位置） |
| `=` | 」 | **右引號**（Dvorak 覆蓋，同 QWERTY `]` 物理位置） |
| `]` | ＝ | 等號系列（Dvorak 覆蓋，同 QWERTY `=` 物理位置） |
| `<` | ， | 逗號 |
| `>` | 。 | 句號 |
| `?` | ？ | 問號 |
| `:` | ： | 冒號 |
| `"` | ； | 分號 |
| `~` | ～ | 波浪號 |
| `!` | ！ | 驚嘆號 |
| `(` `)` | （ ） | 括號 |
| `{` `}` | 〔 〕 | 方括號 |

---

## 外掛語言與特殊功能

洋蔥 Plus 版內建多種外掛語言，利用聲調鍵（3/4/6/7）作為啟始鍵切換：

### 語言總覽

| 功能 | 前綴 | 提示 | 說明 |
|------|:----:|------|------|
| 英文 | `3` | 《Easy》 | 88 萬英漢字典 |
| 拉丁字母 | `4` | 《拉》 | 含重音符號的拉丁字母、國際音標 |
| 日文 | `6` | 《日》 | 108 萬詞彙（平假名、片假名、漢字） |
| 俄文 | `66` | 《俄》 | 西里爾字母 |
| 韓文 | `7` | 《韓》 | 韓語 HNC 鍵位 |
| 希臘文 | `77` | 《希》 | 希臘字母 |
| 全形 | `][` | 《全》 | 全形英數字 |
| 注音文 | `';` | 《注音文》 | 輸出注音符號本身 |
| emoji | `` ` `` | 《emoji集》 | 表情符號與顏文字 |
| 倉頡反查 | `]` + 倉頡碼 | 《查》 | 用倉頡碼查注音（不知道發音時用） |
| Lua 功能 | `'/` | — | 日期時間、計算機、Unicode 等 |

### 英文模式（啟始鍵 `3`）

88 萬單字片語 + 76 萬翻譯條目。

| 操作 | 說明 |
|------|------|
| `3` + 英文字母 | 搜尋英文單字 |
| `;` | 首字母大寫（如 `;hello` → Hello） |
| `;;` | 全大寫（如 `;;hello` → HELLO） |
| `.` 或 `/` | 空格（如 `hello.world` → hello world） |

### 日文模式（啟始鍵 `6`）

| 操作 | 說明 |
|------|------|
| `,` | 平假名 |
| `.` | 片假名 |
| `;` | 漢字（五十音對映） |
| `-` | 長音「ー」 |

### 拉丁字母（啟始鍵 `4`）

| 操作 | 說明 |
|------|------|
| `/` | 小寫字母 |
| `;` | 大寫字母 |
| `;;` | 組合變音標記 |

### emoji 與系列符號（啟始鍵 `` ` ``）

| 操作 | 說明 |
|------|------|
| `` ` `` + 注音 | 用注音輸入分類名稱調出 emoji（如「笑」「天氣」「食物」） |
| `` ` `` + 字母/數字 | 帶框、圈、括號的字母或數字 |
| `` ` `` `` ` `` + 數字 | 顏文字系列 |

### 反查（啟始鍵 `]`）

不知道某個字的注音時，用倉頡碼輸入，Rime 會顯示該字的注音。

> Dvorak 上 `]` 在 QWERTY `=` 的物理位置。

### Lua 特殊功能（啟始鍵 `'/`）

| 操作 | 說明 |
|------|------|
| `'/f` | 輸出目前日期 |
| `'/t` 或 `'/n` | 輸出目前時間 |
| `'/` + 數字 + 運算符 | 計算機（如 `'/12+34`） |
| `'/u` 或 `'/x` + hex | Unicode 內碼輸入 |
| `'/c` + 數字 | 十進位 Unicode |
| `'/;` + 字母 | 全大寫字母 |
| `'/'` + 字母 | 首字母大寫 |
| `'//` + 字母 | 全小寫字母 |
| `'/kk` | 顯示快捷鍵說明 |
| `'/ko` | 顯示操作鍵說明 |

### 注音文（啟始鍵 `';`）

輸出注音符號本身（如「ㄅㄆㄇ」），而不是轉成中文字。

也可以用 `Shift+P`（Phonetic）或 `Control+Enter` 直接上屏目前的注音編碼。

### 短語功能

可自訂常用短語，編輯 `bopomo_onionplus_phrase.txt` 後重新部署即可。

| 操作 | 說明 |
|------|------|
| `'/jc` | 快速開啟短語文件編輯 |
| `'/a` 或 `'/,` | 列出所有短語 |

---

## Control 開關鍵

洋蔥 Plus 版提供多個 Control 組合鍵來切換各種功能：

### 基本切換（需使用 default.custom.yaml）

| 按鍵 | 功能 |
|------|------|
| `Control+Shift+1` | 變換方案 |
| `Control+Shift+2` | 切換中/英文 |
| `Control+Shift+3` | 切換全形/半形 |
| `Control+Shift+4` | 切換標點全形/半形 |
| `Control+Shift+5` | 切換繁體/簡體 |

### Plus 版限定

| 按鍵 | 切換功能 |
|------|----------|
| `Control+[` / `Control+Shift+[` | 關閉/開啟 附加 Emoji |
| `Control+]` / `Control+Shift+]` | 關閉/開啟 外語和符號註釋 |
| `Control+'` / `Control+Shift+'` | 切換中文字符範圍（完整/精簡） |

### Caps Lock

在 `default.custom.yaml` 中設定為 `commit_text`，按下會上屏目前輸入並切換大小寫。

---

## 已知問題

### 方向鍵在 Electron 類 app 中穿透

在 Cursor、VSCode 等 Electron 應用中，方向鍵事件可能同時作用在 Rime 和 app 上（例如按 ↑ 移動注音游標的同時，app 也回溯歷史輸入）。

**解決方式**：

1. **使用 Shift 流派**：Shift+字母組合不會穿透到 app（推薦）
2. **設定 app_options**：在 `squirrel.custom.yaml` 中針對特定 app 設定 `inline: true`，可能改善按鍵處理：

```yaml
patch:
  app_options:
    com.todesktop.230313mzl4w4u92:  # Cursor
      inline: true
    com.microsoft.VSCode:
      inline: true
```

> `inline: true` 會讓 Rime 在該 app 中使用行內編輯模式，按鍵處理可能更好。
> 需要重新部署鼠鬚管後生效。app 的 bundle ID 可用 `mdls -name kMDItemCFBundleIdentifier /Applications/Cursor.app` 查詢。

### `\` 鍵的雙重身份

`\` 在 composing 狀態（選字時）是「刪除一個注音字符」，在非 composing 狀態是原始的反斜線。這是 upstream 的設計。

### Shift+空白的雙重綁定

`Shift+空白` 在 `default.custom.yaml` 中設定為中英切換（`when: always`），所以 element 中的 Page Down 綁定不會生效。翻頁請用 `Shift+J/K` 或方向鍵。

---

## 建議的學習順序

**第一天：基本輸入**
- 練習打字 → 空白/聲調 → Enter 上屏的節奏
- 熟悉 Dvorak 鍵位上的注音位置
- 用 `Shift+空白` 切換中英文

**第一週：選字與修正（方向鍵流派）**
- 學會用 ← → 翻頁，Enter 確認
- 學會用 Tab 逐字確認（Tab 流）
- 學會用 BackSpace 刪除重打

**熟練後：Shift 流派**
- 學會用 Shift+H/T/N/S/M/W/V/Z 選字
- 學會用 Shift+J/K 翻頁
- 學會用 Shift+B/F 在長句中快速定位
- 學會用 Shift+A/E 跳到開頭/結尾

**進階功能**
- 嘗試外掛功能（英文 `3`、emoji `` ` ``）
- 用 `Fn+Shift+Delete` 刪除記憶錯誤的詞

---

## 與 QWERTY 原版的完整對照

### 選字

| 功能 | QWERTY 原版 | Dvorak 版 | 備註 |
|------|:-----------:|:---------:|------|
| 候選數 | 8 | 8 | |
| 右手選字 1-8 | Shift+Y/H/N/U/J/M/I/K | Shift+H/T/N/S/M/W/V/Z | Dvorak 用中排+下排 |
| 左手選字 1-8 | Shift+Q/A/W/S/X/E/D/C | — | **移除**，改為其他功能 |

### 編輯快捷鍵

| 功能 | QWERTY 原版 | Dvorak 版 | 備註 |
|------|:-----------:|:---------:|------|
| 補一聲 | `Shift+L` | — | **移除**，直接用空白鍵 |
| 上屏原始輸入 | `Shift+O` | `Shift+Enter` | 改用鍵盤原生 |
| 上屏注音文 | `Shift+F` | `Shift+P` | **P**=Phonetic |
| 上屏 comment | `Shift+R` | — | **移除**，低頻功能 |
| BackSpace | `Shift+P` | — | **移除**，用 BackSpace 鍵 |
| Delete | `Shift+T` | — | **移除** |
| Escape | `Shift+G` | `Shift+Q` | **Q**=Quit |
| Home | `Shift+V` | `Shift+A` | **A**=ahead |
| End | `Shift+B` | `Shift+E` | Emacs C-**e** |
| Page Up | `Shift+Z` | `Shift+K` | vi **k**=up |
| Page Down | `Shift+空白` | `Shift+J` | vi **j**=down |
| 右移一個字 | — | `Shift+F` | Emacs C-**f**（Dvorak 新增） |
| 左移回退一個字 | — | `Shift+B` | Emacs C-**b**（Dvorak 新增） |

### 標點符號

| 功能 | QWERTY 按鍵 | Dvorak 按鍵 | 備註 |
|------|:-----------:|:-----------:|------|
| 頓號 | `'` | `-` | 同物理位置（Enter 旁） |
| 左引號「 | `[` | `/` | 同物理位置 |
| 右引號」 | `]` | `=` | 同物理位置 |
| 等號＝ | `=` | `]` | 同物理位置 |
| 逗號 | `<` | `<` | 不變 |
| 句號 | `>` | `>` | 不變 |

### 其他差異

| 項目 | QWERTY 原版 | Dvorak 版 |
|------|-------------|-----------|
| 注音鍵位 | 大千式 QWERTY | 大千式 Dvorak（同物理位置） |
| 選字標籤 | `𝟷𝚀𝚈` 等 (Unicode) | `H` `T` `N` 等 (ASCII) |
| 字典/prism | bopomo_onionplus | 字典共用，prism 獨立編譯 |
| 設定檔 | element_bopomo | element_bopomo_dvorak |

---

## 鼠鬚管（Squirrel）外觀設定

外觀設定在 `squirrel.custom.yaml` 中（透過 mackup 管理或直接放在 `~/Library/Rime/`）。

### 常用設定項

| 設定 | 說明 | 目前值 |
|------|------|--------|
| `style/candidate_list_layout` | 候選框樣式（`stacked` 堆疊 / `linear` 平鋪） | stacked |
| `style/text_orientation` | 文字方向（`horizontal` / `vertical`） | horizontal |
| `style/inline_preedit` | 行內編輯（注音顯示在游標處而非浮動視窗） | false |
| `style/inline_candidate` | 行內顯示第一候選 | false |
| `style/font_face` | 主字體 | SourceHanSansVF-Light |
| `style/font_point` | 字號 | 20 |
| `style/label_font_face` | 候選序號字體 | Menlo |
| `style/label_font_point` | 序號字號 | 14 |
| `style/color_scheme` | 配色方案 | mritd_dark |
| `style/corner_radius` | 視窗圓角 | 4 |

### 針對特定 app 的設定

```yaml
patch:
  app_options:
    com.todesktop.230313mzl4w4u92:  # Cursor
      inline: true                   # 使用行內編輯
    com.microsoft.VSCode:
      inline: true
    com.googlecode.iterm2:
      ascii_mode: true               # 在 iTerm2 中預設英文模式
```

可用選項：`ascii_mode`（預設英文）、`inline`（強制行內編輯）、`no_inline`（禁用行內編輯）、`vim_mode`（退出 VIM 插入模式時自動切換）。

---

## 設計原則

1. **右手兩排選字**：HTNS / MWVZ 八鍵選字，上排 GCR 空出給未來功能
2. **Emacs 風格游標**：F=forward、B=backward，圍繞選字區
3. **助記鍵**：所有功能鍵都有助記（vi/Emacs/英文縮寫），不需死記
4. **一個功能一個鍵**：不重複綁定，簡潔明確

---

## 檔案結構

```
Dvorak 專屬檔案（本 fork 新增）：
├── rimefiles/bopomo_onionplus_dvorak.schema.yaml  # 方案定義
├── rimefiles/element_bopomo_dvorak.yaml            # 按鍵設定
└── rimefiles/各方案default.custom/
    └── 注音洋蔥plus版Dvorak_custom/
        └── default.custom.yaml                     # 預設設定

共用檔案（來自 upstream，不需修改）：
├── rimefiles/bopomo_onionplus.extended.dict.yaml   # 字典
├── rimefiles/punct_bopomo.yaml                     # 標點定義
├── rimefiles/lua/                                  # Lua 腳本
├── rimefiles/opencc/                               # OpenCC 轉換
└── ...（其餘所有 rimefiles/ 下的檔案）
```
