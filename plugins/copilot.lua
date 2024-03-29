return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = false,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "bottom", -- | top | left | right
        ratio = 0.4,
      },
    },

    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<A-m>",
        accept_word = false,
        accept_line = false,
        next = "<A-n>",
        prev = "<A-p>",
        -- dismiss = "<leader>cE",
      },
      -- keymap = {
      -- 	accept = "<M-l>",
      -- 	accept_word = false,
      -- 	accept_line = false,
      -- 	next = "<M-]>",
      -- 	prev = "<M-[>",
      -- 	dismiss = "<C-]>",
      -- },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = true,
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
    server_opts_overrides = {},
  },
  keys = {
    {"<leader>c" ,   desc = "Copilot" },
    {"<leader>ce",    "<cmd>Copilot disable<CR>", desc = "Copilot disable" },
    {"<leader>cb",    "<cmd>Copilot enable<CR>", desc = "Copilot enable" },
    {"<leader>cE",    "<cmd>lua require('copilot.suggestion').dismiss()<cr>", desc = "Copilot dismiss" },
  }
}
