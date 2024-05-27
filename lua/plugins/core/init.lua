-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      -- 自动设置根目录为~/work_space/
      -- set_root = {
      --   {
      --     event = "VimEnter",
      --     desc = "Set root dir",
      --     callback = function()
      --       vim.cmd { cmd = "Neotree", args = { "dir=~/work_space/" } }
      --       vim.cmd { cmd = "Neotree", args = { "close" } }
      --     end,
      --   },
      -- },
    },
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
      update_in_insert = false,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        cmdheight = 0,
        mouse = "",
        cursorline = false,
        -- clipboard = "unnamed,unnamedplus",
        -- guifont = "0xProto_Nerd_Font,Hack_Nerd_Font:h14", -- font name in linux
        guifont = "0xProto,Hack_Nerd_Font:h12", -- font name in windows
        foldopen = "mark,percent,quickfix,search,tag,undo", -- 去掉`hor`
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- 光标位移
        ["<S-Right>"] = { "<Left>" },
        ["L"] = { "5l" },
        ["H"] = { "5h" },
        ["J"] = { "5j" },
        ["K"] = { "5k" },
        ["<C-d>"] = { "10j" },
        ["<C-u>"] = { "10k" },
        ["mj"] = { "mJ" },
        ["mk"] = { "mK" },
        ["gj"] = { "`J" },
        ["gk"] = { "`K" },

        -- 行位移
        ["<A-S-j>"] = { ":m .+1<CR>==" },
        ["<A-S-k>"] = { ":m .-2<CR>==" },
        ["<A-j>"] = { "<S-j>" },

        -- buf位移
        ["<A-o>"] = { "<C-^>" }, -- 在两个最近的标签页间跳转

        -- 按范围删除
        ["c"] = { '"dc' },
        ["C"] = { '"dc' },
        ["s"] = { '"ds' },
        ["S"] = { '"dS' },
        ["X"] = { "dd" }, --剪切一行
        -- ["<C-x>"] = '"+dw', --剪切单词
        ["d"] = { '"_d' }, --删除
        ["D"] = { '"_D' },
        ["dL"] = { '"_d$' },
        ["dH"] = { '"_d^' },

        -- 按文本对象删除
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
        ["<BS>"] = { '%"_x``"_x' }, -- 删除一对括号

        -- 删除buf
        ["<Leader>c"] = false,
        ["<Leader>C"] = false,
        ["<A-c>"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
        ["<A-C>"] = { function() require("astrocore.buffer").close_all(true) end, desc = "Close all buffers" },

        ["dm"] = { function() vim.cmd "%s/\r//g" end, desc = "Remove ^M" },

        -- 添加标点、括号
        ["<A-;>"] = { "$a;<ESC>" }, --句尾添';'
        ["<A-,>"] = { "$a,<ESC>" },
        ["<A-.>"] = { "bi<<ESC>ea><ESC>" },
        ["<A-s>"] = { 'bi"<ESC>ea"<ESC>' },
        ["<A-i>"] = { "bi{<ESC>ea}<ESC>" },
        ["<A-'>"] = { "bi'<ESC>ea'<ESC>" },
        ["<A-b>"] = { "bi(<ESC>ea)<ESC>" },
        ["<A-9>"] = { "bi(<ESC>ea)<ESC>" },
        ["<A-[>"] = { "bi[<ESC>ea]<ESC>" },
        ["<A-7>"] = "mtbi&<Esc>`t", -- 单词首部添加'&'
        ["<A-8>"] = "mtbi*<Esc>`t", -- 单词首部添加'*'

        -- 复制
        ["yw"] = { "byw" }, -- 复制单词
        ["yib"] = { "yi(" },
        ["yis"] = { 'yi"' },
        ["yii"] = { "yi{" },
        -- ["1y"] = { '"1y' },
        -- ["1p"] = { '"1p' },
        -- ["2y"] = { '"2y' },
        -- ["2p"] = { '"2p' },
        -- ["3y"] = { '"3y' },
        -- ["3p"] = { '"3p' },
        -- ["4y"] = { '"4y' },
        -- ["4p"] = { '"4p' },
        -- ["5y"] = { '"5y' },
        -- ["5p"] = { '"5p' },
        -- ["1Y"] = { '"1Y' },
        -- ["1P"] = { '"1P' },
        -- ["2Y"] = { '"2Y' },
        -- ["2P"] = { '"2P' },
        -- ["3Y"] = { '"3Y' },
        -- ["3P"] = { '"3P' },
        -- ["4Y"] = { '"4Y' },
        -- ["4P"] = { '"4P' },
        -- ["5Y"] = { '"5Y' },
        -- ["5P"] = { '"5P' },

        -- 其它
        ["<C-a>"] = { "gg^vG$" }, -- 选中所有
        ["<A-a>"] = { "<C-a>" }, -- 值加1
        ["<A-d>"] = { "<C-x>" }, -- 值减1
        ["<A-f>"] = { "/<C-r>+<CR>" }, --搜寻复制内容
        ["<Enter>"] = "mto<Esc>`t", -- 在下一行插入空行
        ["<Leader>h"] = false,
        ["<Leader>;"] = {
          function()
            local wins = vim.api.nvim_tabpage_list_wins(0)
            if #wins > 1 and vim.bo[vim.api.nvim_win_get_buf(wins[1])].filetype == "neo-tree" then
              vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
            end
            require("alpha").start(false)
          end,
          desc = "Home Screen",
        },
        ["<Leader>E"] = {
          function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.wincmd "p"
            else
              vim.cmd.Neotree "focus"
            end
          end,
          desc = "Toggle Explorer Focus",
        },
        ["<Leader>o"] = { function() require("aerial").toggle() end, desc = "Symbols outline" },
        ["<Leader>z"] = { function() vim.cmd "ZenMode" end, desc = "Zen mode" },
        ["zh"] = { "zc", desc = "Close fold under cursor" },
        ["zl"] = { "zo", desc = "Open fold under cursor" },

        -- 打开终端
        ["<A-4>"] = {
          function()
            local dir = tostring(vim.fn.expand "%:p:h")
            require("toggleterm").exec("cd " .. dir .. " & zsh", 3, nil, nil, "float", "Term3", false, true)
          end,
          desc = "ToggleTerm current dir",
        },
        ["<A-5>"] = {
          "<cmd>4ToggleTerm size=10 direction=horizontal<CR>",
          -- function() require("toggleterm").exec("zsh", 4, 10, nil, "horizontal", "Term4", false, true) end,
          desc = "ToggleTerm horizontal split",
        },
        ["<A-3>"] = {
          "<cmd>3ToggleTerm direction=float<CR>",
          -- function() require("toggleterm").exec("zsh", 3, nil, nil, "float", "Term3", false, true) end,
          desc = "ToggleTerm float",
        },
        ["<A-2>"] = {
          "<cmd>2ToggleTerm size=10 direction=horizontal<CR>",
          -- function() require("toggleterm").exec("zsh", 2, 10, nil, "horizontal", "Term2", false, true) end,
          desc = "ToggleTerm horizontal split",
        },
        ["<A-1>"] = {
          "<cmd>1ToggleTerm size=50 direction=vertical<CR>",
          -- function() require("toggleterm").exec("zsh", 1, 50, nil, "vertical", "Term1", false, true) end,
          desc = "ToggleTerm vertical split",
        },

        -- 保存
        ["<Leader>w"] = {
          function()
            vim.lsp.buf.format(require("astrolsp").format_opts)
            vim.cmd "w!"
          end,
          desc = "Save with formmat",
        },
        ["<Leader>W"] = { "<cmd>w!<cr>", desc = "Save" },

        ["<Leader>n"] = false,
      },
      i = {
        ["<S-Right>"] = { "<Left>" },

        ["jj"] = { "<Esc>" },
        ["jk"] = { "<Esc>" },

        ["<A-S-j>"] = { "<Esc>:m .+1<CR>==gi" },
        ["<A-S-k>"] = { "<Esc>:m .-2<CR>==gi" },

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

        -- ["<S-l><S-l>"] = "<Esc><S-a>",
        -- ["<S-h><S-h>"] = "<Esc><S-i>",

        ["<C-h>"] = { "<Esc>gh" },
        ["<C-l>"] = { "<Esc>lgh" },
      },
      v = {
        -- 移动行
        ["<A-S-j>"] = { ":m .+1<CR>==" },
        ["<A-S-k>"] = { ":m .-2<CR>==" },

        -- 光标位移
        ["<S-Right>"] = { "<Left>" },
        ["L"] = { "5l" },
        ["H"] = { "5h" },
        ["J"] = { "5j" },
        ["K"] = { "5k" },

        ["<C-a>"] = { "<ESC>gg" }, --取消全选
        ["<A-a>"] = { "<C-a>" },

        -- 复制与删除
        ["X"] = { "D" }, --剪切一行
        ["d"] = { '"_d' }, --删除
        ["D"] = { '"_D' },
        ["p"] = { '"_dP' }, -- 粘贴后不会复制被粘贴的文本
        -- ["1y"] = { '"1y' },
        -- ["1p"] = { '"_d"1P' },
        -- ["2y"] = { '"2y' },
        -- ["2p"] = { '"_d"2P' },
        -- ["3y"] = { '"3y' },
        -- ["3p"] = { '"_d"3P' },
        -- ["4y"] = { '"4y' },
        -- ["4p"] = { '"_d"4P' },
        -- ["5y"] = { '"5y' },
        -- ["5p"] = { '"_d"5P' },
        -- ["1Y"] = { '"1Y' },
        -- ["1P"] = { '"_d"1P' },
        -- ["2Y"] = { '"2Y' },
        -- ["2P"] = { '"_d"2P' },
        -- ["3Y"] = { '"3Y' },
        -- ["3P"] = { '"_d"3P' },
        -- ["4Y"] = { '"4Y' },
        -- ["4P"] = { '"_d"4P' },
        -- ["5Y"] = { '"5Y' },
        -- ["5P"] = { '"_d"5P' },

        -- 添加标点、括号
        ["<A-s>"] = { '"-xi""<Esc>"-P' },
        ["<A-i>"] = { '"-xi{}<Esc>"-P' },
        ["<A-'>"] = { "\"-xi''<Esc>\"-P" },
        ["<A-b>"] = { '"-xi()<Esc>"-P' },
        ["<A-[>"] = { '"-xi[]<Esc>"-P' },
        ["<A-.>"] = { '"-xi<><Esc>"-P' },

        ["s"] = false,
        ["S"] = false,
      },
      t = {
        ["<S-Right>"] = { "<Left>" },
        -- ["L"] = { "5l" },
        -- ["H"] = { "5h" },
        -- ["J"] = { "5j" },
        -- ["K"] = { "5k" },

        -- 关闭终端
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

        ["<A-h>"] = { "<cmd>lua require('luasnip').jump(-1)<Cr>" },
        ["<A-l>"] = { "<cmd>lua require('luasnip').jump(1)<Cr>" },
      },
    },
  },
}
