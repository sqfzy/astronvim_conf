-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
local is_available = utils.is_available
return {
  n = {
    ["<A-j>"] = { ":m .+1<CR>==" },
    ["<A-k>"] = { ":m .-2<CR>==" },
    ["L"] = { "5l" },
    ["H"] = { "5h" },
    ["J"] = { "5j" },
    ["K"] = { "5k" },
    ["c"] = { '"dc' },
    ["s"] = { '"ds' },
    ["<C-d>"] = { "10j" },
    ["<C-u>"] = { "10k" },
    ["<C-a>"] = { "gg^vG$" },
    ["<A-a>"] = { "<C-a>" }, --值加1
    ["<A-d>"] = { "<C-x>" }, --值减1
    -- ["<C-n>"] = "&", --重复替换操作
    ["yw"] = { "byw" }, -- 复制单词
    ["ty"] = { '"ty' },
    ["yib"] = { "yi(" },
    ["yis"] = { 'yi"' },
    ["yii"] = { "yi{" },
    ["tp"] = { '"tp' },
    ["X"] = { "dd" }, --剪切一行
    -- ["<C-x>"] = '"+dw', --剪切单词
    ["d"] = { '"_d' }, --删除
    ["D"] = { '"_D' },
    ["dL"] = { '"_d$' },
    ["dH"] = { '"_d^' },
    ["E"] = { "ea<Space>" },
    ["B"] = { "bi<Space><Left>" },
    ["mj"] = { "mJ" },
    ["mk"] = { "mK" },
    ["gj"] = { "`J" },
    ["gk"] = { "`K" },
    -- 折叠
    ["zh"] = { "zfi{" },
    ["zl"] = { "zo" },
    ["<C-i>"] = { "<C-i>" },

    -- ["<leader>c"] = false,
    ["<leader>bc"] = false,
    ["]b"] = false,
    ["[b"] = false,
    ["<A-c>"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<A-C>"] = {
      function() require("astronvim.utils.buffer").close_all(true) end,
      desc = "Close all buffers except current",
    },
    ["<A-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<A-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<A-right>"] = {
      function() require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Move buffer tab right",
    },
    ["<A-left>"] = {
      function() require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Move buffer tab left",
    },
    ["<A-o>"] = { "<C-^>" }, -- 在两个最近的标签页间跳转
    ["<A-v>"] = { ":vs<CR>" },
    ["<A-x>"] = { ":sp<CR>" }, --m == alt ()
    -- 添加，替换，搜索
    ["<A-;>"] = { "$a;<ESC>" }, --句尾添';'
    ["<A-,>"] = { "bi<<ESC>ea><ESC>" },
    ["<A-s>"] = { 'bi"<ESC>ea"<ESC>' },
    ["<A-i>"] = { "bi{<ESC>ea}<ESC>" },
    ["<A-'>"] = { "bi'<ESC>ea'<ESC>" },
    ["<A-b>"] = { "bi(<ESC>ea)<ESC>" },
    ["<A-9>"] = { "bi(<ESC>ea)<ESC>" },
    ["<A-[>"] = { "bi[<ESC>ea]<ESC>" },
    ["cb"] = { '"_cib' }, --()
    ["ci"] = { '"_ciB' }, --{}
    ["cw"] = { '"_ciw' }, --单词
    ["cs"] = { '"_ci"' }, --字符串
    ["c'"] = { "\"_ci'" }, -- ''
    ["c["] = { '"_ci[' }, -- []
    ["c,"] = { '"_ci<' }, -- <>
    ["db"] = { '"tyi(da(h"tp' },
    ["d9"] = { '"tyi(da(h"tp' },
    ["ds"] = { '"tyi"da"h"tp' },
    ["d["] = { '"tyi[da[h"tp' },
    ["di"] = { '"tyi{da{h"tp' },
    ["<BS>"] = { 'mt%"_x`ta<BS><Space><Esc>' },
    ["<A-f>"] = { "/<C-r>+<CR>" }, --搜寻复制内容
    [";"] = { "n" },
    [","] = { "N" },
    ["<A-Down>"] = { "O<Esc>" },
    ["<A-Up>"] = { "o<Esc>" },
    ["q"] = { "<ESC>" }, -- 'q' make autopairs not work
    ["<Enter>"] = "mto<Esc>`t",
    ["<A-7>"] = "mtbi&<Esc>`t",
    ["<A-8>"] = "mtbi*<Esc>`t",

    ["<A-4>"] = {
      function()
        local dir = tostring(vim.fn.expand "%:p:h")
        require("toggleterm").exec("cd " .. dir .. " & zsh", 3, nil, nil, "float", "Term3", false, true)
      end,
      desc = "ToggleTerm current dir",
    },
    ["<A-5>"] = {
      -- "<cmd>4ToggleTerm size=10 direction=horizontal<CR>",
      function() require("toggleterm").exec("zsh", 4, 10, nil, "horizontal", "Term4", false, true) end,
      desc = "ToggleTerm horizontal split",
    },
    ["<A-3>"] = {
      -- "<cmd>3ToggleTerm direction=float<CR>",
      function() require("toggleterm").exec("zsh", 3, nil, nil, "float", "Term3", false, true) end,
      desc = "ToggleTerm float",
    },
    ["<A-2>"] = {
      -- "<cmd>2ToggleTerm size=10 direction=horizontal<CR>",
      function() require("toggleterm").exec("zsh", 2, 10, nil, "horizontal", "Term2", false, true) end,
      desc = "ToggleTerm horizontal split",
    },
    ["<A-1>"] = {
      -- "<cmd>1ToggleTerm size=50 direction=vertical<CR>",
      function() require("toggleterm").exec("zsh", 1, 50, nil, "vertical", "Term1", false, true) end,
      desc = "ToggleTerm vertical split",
    },

    ----------------------------- which key ------------------------------------------
    ["<leader>w"] = { "<cmd>lua vim.lsp.buf.format()<cr><cmd>w!<cr>", desc = "Save with format" },
    ["<leader>W"] = { "<cmd>w!<cr>", desc = "Save" },
    ["<leader>z"] = { "<cmd>ZenMode<CR>", desc = "ZenMode" },
    ["<leader>lm"] = { "<cmd>Mason<cr>", desc = "Mason" },
    ["<leader>h"] = { "<cmd>nohlsearch<CR>", desc = "No hlsearch" },
    ["<leader>;"] = is_available "alpha-nvim" and {
      function()
        local wins = vim.api.nvim_tabpage_list_wins(0)
        if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
          vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
        end
        require("alpha").start(false, require("alpha").default_config)
      end,
      desc = "Home Screen",
    },
    ["<leader>br"] = false,
    ["<leader>bh"] = {
      function() require("astronvim.utils.buffer").close_left() end,
      desc = "Close all buffers to the left",
    },
    ["<leader>bl"] = {
      function() require("astronvim.utils.buffer").close_right() end,
      desc = "Close all buffers to the right",
    },
    ["<Tab>"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
    ["<S-Tab>"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
    ["<leader>fT"] = { "<cmd>TodoTelescope<CR>", desc = "Find todo" },
    ["<leader>tt"] = { "<cmd>ToggleTerm direction=tab<CR>", desc = "New term tab" },
    ["<leader>fH"] = { "<cmd>Telescope highlights<CR>", desc = "Find highlight" },

    ["<leader>n"] = { name = "Neo tree" },
    ["<leader>nh"] = { "<cmd>Neotree ~/<CR>", desc = "Home" },
    -- ["<leader>ns"] = { "<cmd>Neotree ~/share/code_my/<CR>", desc = "shared code dir" },
    ["<leader>nc"] = { "<cmd>Neotree ~/work_space/<CR>", desc = "code dir" },
    ["<leader>nC"] = { "<cmd>Neotree share/work_space/<CR>", desc = "code dir" },
    ["<leader>na"] = { "<cmd>Neotree ~/.config/nvim/lua/<CR>", desc = "astronvim dir" },

    -- ["<leader>tf"] = false,
    -- ["<leader>th"] = false,
    -- ["<leader>tv"] = false,
    -- ["<leader>tr"] = { "<cmd>Neotest run<CR>", desc = "run test" },
    -- ["<leader>to"] = { "<cmd>Neotest output<CR>", desc = "test output" },
    -- ["<leader>tn"] = { "<cmd>Neotest jump next<CR>", desc = "next test" },
    -- ["<leader>tp"] = { "<cmd>Neotest jump prev<CR>", desc = "prev test" },
    -- ["<leader>ts"] = { "<cmd>Neotest summary<CR>", desc = "test summary" },

    ["<leader>lt"] = { "<cmd>ToggleLSP<CR>", desc = "LSP toggle" },
    ["<leader>lT"] = { "<cmd>ToggleNullLSP<CR>", desc = "Null-ls toggle" },
  },
  i = {
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi" },
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi" },
    -- navigation
    ["<A-Up>"] = { "<C-\\><C-N><C-w>k" },
    ["<A-Down>"] = { "<C-\\><C-N><C-w>j" },
    ["<A-Left>"] = { "<C-\\><C-N><C-w>h" },
    ["<A-Right>"] = { "<C-\\><C-N><C-w>l" },

    ["jj"] = { "<ESC>" },
    ["jk"] = { "<ESC>" },
    ["<A-;>"] = { "<ESC>$a;" }, --句尾添';'
    ["<A-s>"] = { '<ESC>bi"<ESC>ea"' },
    ["<A-i>"] = { "<ESC>bi{<ESC>ea}" },
    ["<A-9>"] = { "<ESC>bi(<ESC>ea)" },
    ["<A-'>"] = { "<ESC>bi'<ESC>ea'" },
    ["<A-[>"] = { "<ESC>bi[<ESC>ea]" },
    ["<A-,>"] = { "<ESC>bi<<ESC>ea>" },
    ["<A-->"] = { "->" },
    ["<A-=>"] = { "=>" },
    -- ["<Tab>"] = "<Right>",
    -- ["<S-Tab>"] = "<Left>",
    ["<S-Right>"] = { "<Left>" },

    -- ["<S-l><S-l>"] = "<Esc><S-a>",
    -- ["<S-h><S-h>"] = "<Esc><S-i>",

    ["<C-h>"] = { "<Esc>gh" },
    ["<C-l>"] = { "<Esc>lgh" },

    ----------------------------- lunsnip ------------------------------------------
    ["<A-n>"] = { "<Plug>luasnip-next-choice" },
    ["<A-p>"] = { "<Plug>luasnip-prev-choice" },
    ["<A-h>"] = { "<cmd>lua require('luasnip').jump(-1)<Cr>" },
    ["<A-l>"] = { "<cmd>lua require('luasnip').jump(1)<Cr>" },
  },
  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv-gv" },
    ["<A-k>"] = { ":m '<-2<CR>gv-gv" },

    ["H"] = { "^" },
    ["L"] = { "$" },
    ["<C-a>"] = { "<ESC>gg" }, --取消全选
    ["<A-a>"] = { "<C-a>" },
    ["ty"] = { '"ty' },
    ["X"] = { "D" }, --剪切一行
    ["d"] = { '"_d' }, --删除
    ["D"] = { '"_D' },
    ["p"] = { '"_dP' }, -- 粘贴后不会复制被粘贴的文本
    ["tp"] = { '"_d"tP' },
    ["zh"] = { "zf" },
    ["<A-s>"] = { '"-xi""<Esc>"-P' },
    ["<A-i>"] = { '"-xi{}<Esc>"-P' },
    ["<A-'>"] = { "\"-xi''<Esc>\"-P" },
    ["<A-b>"] = { '"-xi()<Esc>"-P' },
    ["<A-[>"] = { '"-xi[]<Esc>"-P' },
    ["<A-,>"] = { '"-xi<><Esc>"-P' },

    ["<leader>y"] = {
      "Y<cmd>'<,'>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      desc = "Copy and Comment",
    },
    ["<leader>p"] = {
      "Dk<Esc>p",
      desc = "Delete and Paste",
    },

    ["<leader>r"] = { name = "Rust" },
    ["<leader>ru"] = { "<cmd>lua require('crates').update_crates<CR>", desc = "Update Crate" },
    ["<leader>rU"] = { "<cmd>lua require('crates').upgrade_crates<CR>", desc = "Upgrade Crate" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- Better indenting
    ["<A-4>"] = { function() require("toggleterm").exec("exit", 3) end, desc = "ToggleTerm float" },
    ["<A-3>"] = { "<cmd>3ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["<A-2>"] = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    ["<A-1>"] = { "<cmd>1ToggleTerm size=50 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
    ["<Esc>"] = { "<c-\\><c-n>", desc = "Back normal mode" },
  },
  s = {
    ["p"] = { "p" },
    ["d"] = { "d" },
    ["D"] = { "D" },
    ["<BS>"] = { "<BS>i" },
    ["<C-l>"] = { "<Right>" },
    ["<C-h>"] = { "<Left>" },

    ["<A-n>"] = { "<Plug>luasnip-next-choice" },
    ["<A-p>"] = { "<Plug>luasnip-prev-choice" },
    ["<A-h>"] = { "<cmd>lua require('luasnip').jump(-1)<Cr>" },
    ["<A-l>"] = { "<cmd>lua require('luasnip').jump(1)<Cr>" },
  },
  x = {},
  o = {},
}
