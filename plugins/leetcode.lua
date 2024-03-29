return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- configuration goes here
    ---@type string
    arg = "leetcode.nvim",

    ---@type lc.lang
    lang = "rust",

    cn = { -- leetcode.cn
      enabled = true, ---@type boolean
      translator = true, ---@type boolean
      translate_problems = true, ---@type boolean
    },

    ---@type lc.storage
    storage = {
      home = vim.fn.stdpath "data" .. "/leetcode",
      cache = vim.fn.stdpath "cache" .. "/leetcode",
    },

    ---@type boolean
    logging = true,

    injector = {}, ---@type table<lc.lang, lc.inject>

    cache = {
      update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
    },

    console = {
      open_on_runcode = true, ---@type boolean

      dir = "row", ---@type lc.direction

      size = { ---@type lc.size
        width = "90%",
        height = "75%",
      },

      result = {
        size = "60%", ---@type lc.size
      },

      testcase = {
        virt_text = true, ---@type boolean

        size = "40%", ---@type lc.size
      },
    },

    description = {
      position = "left", ---@type lc.position

      width = "40%", ---@type lc.size

      show_stats = true, ---@type boolean
    },

    hooks = {
      ---@type fun()[]
      LeetEnter = {},

      ---@type fun(question: lc.ui.Question)[]
      LeetQuestionNew = {},
    },

    keys = {
      toggle = { "q", "<Esc>" }, ---@type string|string[]
      confirm = { "<CR>" }, ---@type string|string[]

      reset_testcases = "r", ---@type string
      use_testcase = "U", ---@type string
      focus_testcases = "<C-h>", ---@type string
      focus_result = "<C-l>", ---@type string
    },

    ---@type boolean
    image_support = false,
  },
  keys = {
    { "<leader>L", desc = "Leetcode" },
    { "<leader>L;", "<cmd>Leet<CR>", desc = "Start leetcode" },
    { "<leader>Lr", "<cmd>Leet run<CR>", desc = "Run" },
    { "<leader>Lc", "<cmd>Leet console<CR>", desc = "Console" },
    { "<leader>Ls", "<cmd>Leet submit<CR>", desc = "Submit" },
    { "<leader>LS", "<cmd>Leet last_submit<CR>", desc = "Last submit" },
    { "<leader>Ld", "<cmd>Leet description<CR>", desc = "Description" },
    { "<leader>Lp", "<cmd>Leet problem<CR>", desc = "Problem" },
    { "<leader>Lq", "<cmd>Leet question<CR>", desc = "Question" },
    { "<leader>Li", "<cmd>Leet info<CR>", desc = "Info" },
    { "<leader>LL", "<cmd>Leet lang<CR>", desc = "choose language" },
    { "<leader>LR", "<cmd>Leet random<CR>", desc = "random question" },
    { "<leader>Ld", "<cmd>Leet daily<CR>", desc = "daily question" },
    { "<leader>Ll", "<cmd>Leet list<CR>", desc = "daily question" },
    { "<leader>Lh", "<cmd>Leet hints<CR>", desc = "Hints" },
  },
}
