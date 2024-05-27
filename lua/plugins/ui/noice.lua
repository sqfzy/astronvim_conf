return {
  {
    "rcarriga/nvim-notify",
    opts = function(_, opts)
      opts.background_colour = "#000000"
      -- opts.stages = "static"
      -- opts.render = "compact"
      -- opts.max_width = "30"
      -- opts.fps = 5
      -- opts.level = 1
      -- opts.timeout = 1000
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      local utils = require "astrocore"
      return utils.extend_tbl(opts, {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          -- 会覆盖'K'按键的映射
          hover = {
            enabled = false,
            silent = false, -- set to true to not show a message if hover is not available
            view = nil, -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {}, -- merged with defaults from documentation
          },
          -- 与 lsp_signature.nvim 冲突
          signature = {
            enabled = true,
            auto_open = {
              enabled = false,
              trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
              luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
              throttle = 50, -- Debounce lsp signature help request by 50ms
            },
            view = nil, -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {}, -- merged with defaults from documentation
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = utils.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              find = " change;",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              kind = "message",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              find = "more lines",
            },
            opts = { skip = true },
          },

          {
            filter = {
              event = "msg_show",
              find = "fewer lines",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              find = "written",
            },
            opts = { skip = true },
          },
        },
      })
    end,
  },
}
