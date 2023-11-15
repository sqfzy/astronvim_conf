return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = {
    symbols_in_winbar = {
      enable = true,
      separator = " › ",
      hide_keyword = false,
      folder_level = 1,
      color_mode = true,
      delay = 300,
    },
    callhierarchy = {
      layout = "float",
      keys = {
        edit = "e",
        vsplit = "v",
        split = "s",
        tabe = "t",
        quit = "q",
        shuttle = "[w",
        toggle_or_req = "u",
        close = "<C-c>k",
      },
    },
    lightbulb = {
      enable = false,
      enable_in_insert = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },
    code_action = {
      num_shortcut = true,
      show_server_name = true,
      extend_gitsigns = false,
    },
    finder = {
      max_height = 0.5,
      left_width = 0.3,
      right_width = 0.5,
      default = "ref+imp",
      methods = {},
      layout = "float",
      filter = {},
      silent = false,
      keys = {
        shuttle = "[w",
        toggle_or_open = "l",
        vsplit = "v",
        split = "s",
        tabe = "t",
        tabnew = "r",
        quit = "q",
        close = "<C-c>",
      },
    },
    definition = {
      width = 0.6,
      height = 0.5,
      keys = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>s",
        tabe = "<C-c>t",
        quit = "q",
        close = "<C-c>",
      },
    },
    implement = {
      enable = true,
      sign = true,
      virtual_text = true,
      priority = 100,
    },
    outline = {
      win_position = "right",
      win_width = 30,
      auto_preview = false,
      detail = true,
      auto_close = true,
      close_after_jump = false,
      ------------ above for normal -----------
      layout = "normal", -- normal or float
      max_height = 0.5, -- for float
      left_width = 0.3, -- for float
      keys = {
        toggle_or_jump = "l",
        quit = "q",
        jump = "e",
      },
    },
    rename = {
      in_select = true,
      auto_save = false,
      project_max_width = 0.5,
      project_max_height = 0.5,
      keys = {
        quit = "<C-k>",
        exec = "<CR>",
        select = "x",
      },
    },
    ui = {
      -- Border type can be single, double, rounded, solid, shadow.
      border = "rounded",
      devicon = true,
      title = true,
      expand = "⊞",
      collapse = "⊟",
      code_action = "💡",
      actionfix = " ",
      lines = { "┗", "┣", "┃", "━", "┏" },
      kind = {},
      imp_sign = "󰳛 ",
    },
  },
}
