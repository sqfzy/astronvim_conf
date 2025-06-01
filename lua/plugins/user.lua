-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

local Snacks = require "snacks"

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  --
  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- opts.picker.win.input.keys = {
      --   ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
      --   ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
      -- }

      opts.dashboard = {
        preset = {
          header = table.concat({

            -- " █████  ███████ ████████ ██████   ██████",
            -- "██   ██ ██         ██    ██   ██ ██    ██",
            -- "███████ ███████    ██    ██████  ██    ██",
            -- "██   ██      ██    ██    ██   ██ ██    ██",
            -- "██   ██ ███████    ██    ██   ██  ██████",
            -- " ",
            -- "    ███    ██ ██    ██ ██ ███    ███",
            -- "    ████   ██ ██    ██ ██ ████  ████",
            -- "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
            -- "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
            -- "    ██   ████   ████   ██ ██      ██",

            -- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ",
            -- "⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ",
            -- "⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ",
            -- "⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ",
            -- "⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ",
            -- "⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ",
            -- "⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ",
            -- "⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ",
            -- "⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ",
            -- "⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ",
            -- "⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ",
            -- "⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ",
            -- "⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ",
            -- "⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ",
            -- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",

            --         [[
            --             __
            --   ___  __ _ / _|____   _
            -- / __|/ _` | ||_  / | | |
            -- \__ \ (_| |  _/ /| |_| |
            -- |___/\__, |_|/___|\__, |
            --         |_|       |___/
            --     ]],

            -- "███████╗ ██████╗ ███████╗███████╗██╗   ██╗",
            -- "██╔════╝██╔═══██╗██╔════╝╚══███╔╝╚██╗ ██╔╝",
            -- "███████╗██║   ██║█████╗    ███╔╝  ╚████╔╝ ",
            -- "╚════██║██║▄▄ ██║██╔══╝   ███╔╝    ╚██╔╝  ",
            -- "███████║╚██████╔╝██║     ███████╗   ██║   ",
            -- "╚══════╝ ╚══▀▀═╝ ╚═╝     ╚══════╝   ╚═╝   ",
            -- " ▄▀▀▀▀▄  ▄▀▀▀▀▄    ▄▀▀▀█▄    ▄▀▀▀▀▄   ▄▀▀▄ ▀▀▄ ",
            -- "█ █   ▐ █      █  █  ▄▀  ▀▄ █     ▄▀ █   ▀▄ ▄▀ ",
            -- "   ▀▄   █      █  ▐ █▄▄▄▄   ▐ ▄▄▀▀   ▐     █   ",
            -- "▀▄   █   ▀▄▄▄▄▀▄   █    ▐     █            █   ",
            -- " █▀▀▀           █  █           ▀▄▄▄▄▀    ▄▀    ",
            -- " ▐              ▐ █                ▐     █     ",
            -- "                  ▐                      ▐     ",
            -- " ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄ ",
            -- "▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌",
            -- "▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌",
            -- "▐░▌          ▐░▌       ▐░▌▐░▌                    ▐░▌▐░▌       ▐░▌",
            -- "▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌",
            -- "▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌",
            -- " ▀▀▀▀▀▀▀▀▀█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀  ▀▀▀▀█░█▀▀▀▀ ",
            -- "          ▐░▌▐░░░░░░░░░░░▌▐░▌          ▐░▌               ▐░▌     ",
            -- " ▄▄▄▄▄▄▄▄▄█░▌ ▀▀▀▀▀▀█░█▀▀ ▐░▌          ▐░█▄▄▄▄▄▄▄▄▄      ▐░▌     ",
            -- "▐░░░░░░░░░░░▌        ▐░▌  ▐░▌          ▐░░░░░░░░░░░▌     ▐░▌     ",
            -- " ▀▀▀▀▀▀▀▀▀▀▀          ▀    ▀            ▀▀▀▀▀▀▀▀▀▀▀       ▀      ",
            "  ██████   █████    █████▒▒███████▒▓██   ██▓",
            "▒██    ▒ ▒██▓  ██▒▓██   ▒ ▒ ▒ ▒ ▄▀░ ▒██  ██▒",
            "░ ▓██▄   ▒██▒  ██░▒████ ░ ░ ▒ ▄▀▒░   ▒██ ██░",
            "  ▒   ██▒░██  █▀ ░░▓█▒  ░   ▄▀▒   ░  ░ ▐██▓░",
            "▒██████▒▒░▒███▒█▄ ░▒█░    ▒███████▒  ░ ██▒▓░",
            "▒ ▒▓▒ ▒ ░░░ ▒▒░ ▒  ▒ ░    ░▒▒ ▓░▒░▒   ██▒▒▒ ",
            "░ ░▒  ░ ░ ░ ▒░  ░  ░      ░░▒ ▒ ░ ▒ ▓██ ░▒░ ",
            "░  ░  ░     ░   ░  ░ ░    ░ ░ ░ ░ ░ ▒ ▒ ░░  ",
            "      ░      ░              ░ ░     ░ ░     ",
            "                          ░         ░ ░     ",
          }, "\n"),
        },
      }
    end,
    keys = {
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>s:", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<leader>sc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      { "<leader>sn", function() Snacks.picker.notifications() end, desc = "Notification History" },
    },
    config = function(_, _)
      vim.api.nvim_create_user_command(
        "Message",
        function() Snacks.notifier.show_history() end,
        { desc = "Notification History" }
      )

      vim.api.nvim_create_user_command("Marks", function() Snacks.picker.marks() end, { desc = "Marks" })
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },
}
