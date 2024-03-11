return {
  {
    "simrat39/rust-tools.nvim",
    opts = function(_, opts)
      opts.tools = { -- rust-tools options

        -- how to execute terminal commands
        -- options right now: termopen / quickfix / toggleterm / vimux
        executor = require("rust-tools.executors").termopen,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = function()
          -- vim.notify "Callback to run when the LSP client is ready"
          vim.lsp.inlay_hint.enable(0, false)
          vim.lsp.inlay_hint.enable(0, true)
        end,

        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
          -- automatically set inlay hints (type hints)
          -- default: true
          auto = false,

          -- Only show inlay hints for the current line
          only_current_line = false,

          -- whether to show parameter hints with the inlay hints or not
          -- default: true
          show_parameter_hints = true,

          -- prefix for parameter hints
          -- default: "<-"
          parameter_hints_prefix = "<- ",

          -- prefix for all the other hints (type, chaining)
          -- default: "=>"
          other_hints_prefix = "=> ",

          -- whether to align to the length of the longest line in the file
          max_len_align = false,

          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,

          -- whether to align to the extreme right or not
          right_align = false,

          -- padding from the right if right_align is true
          right_align_padding = 7,

          -- The color of the hints
          highlight = "Comment",
        },
      }
      -- maps.n["<leader>r"] = { name = "Rust" }
      -- maps.n["<leader>rr"] = { "<cmd>RustRunnables<CR>", desc = "Runnables" }
      -- maps.n["<leader>rm"] = { "<cmd>RustExpandMacro<CR>", desc = "Expand Macro" }
      -- maps.n["<leader>rc"] = { "<cmd>RustOpenCargo<CR>", desc = "Open Cargo" }
      -- maps.n["<leader>rd"] = { "<cmd>RustDebuggables<CR>", desc = "Debuggables" }
      -- maps.n["<leader>rR"] = { "<cmd>lua require('crates').reload<CR>", desc = "Reload" }
      -- maps.n["<leader>rv"] = { "<cmd>lua require('crates').show_versions_popup<CR>", desc = "Show Versions" }
      -- maps.n["<leader>rf"] = { "<cmd>lua require('crates').show_features_popup<CR>", desc = "Show Features" }
      -- maps.n["<leader>rD"] = { "<cmd>lua require('crates').show_dependencies_popup<CR>", desc = "Show Dependencies" }
      -- maps.n["<leader>ru"] = { "<cmd>lua require('crates').update_crate<CR>", desc = "Update Crate" }
      -- maps.n["<leader>ra"] = { "<cmd>lua require('crates').update_all_crates<CR>", desc = "Update All Crates" }
      -- maps.n["<leader>rU"] = { "<cmd>lua require('crates').upgrade_crate<CR>", desc = "Upgrade Crate" }
      -- maps.n["<leader>rA"] = { "<cmd>lua require('crates').upgrade_all_crates<CR>", desc = "Upgrade All Crates" }
      -- maps.n["<leader>re"] = { "<cmd>lua require('crates').expand_plain_crate_to_inline_table<CR>", desc = "Expand Crate" }
      -- maps.n["<leader>rE"] = { "<cmd>lua require('crates').extract_crate_into_table<CR>", desc = "Extract Crate" }
      -- maps.n["<leader>rt"] = {
      --   function()
      --     require("toggleterm").exec(
      --       "cargo nextest run " .. vim.api.nvim_eval 'expand("<cword>")',
      --       2,
      --       10,
      --       tostring(vim.fn.expand "%:p:h"),
      --       "horizontal",
      --       "rust test",
      --       false,
      --       true
      --     )
      --   end,
      --   desc = "Cargo Nextest",
      -- }
    end,
    keys = {
      { "<leader>r", desc = "Rust" },
      { "<leader>rr", "<cmd>RustRunnables<CR>", desc = "Runnables" },
      { "<leader>rm", "<cmd>RustExpandMacro<CR>", desc = "Expand Macro" },
      { "<leader>rc", "<cmd>RustOpenCargo<CR>", desc = "Open Cargo" },
      { "<leader>rd", "<cmd>RustDebuggables<CR>", desc = "Debuggables" },
    },
  },
  {
    "Saecki/crates.nvim",
    keys = {
      { "<leader>rR", "<cmd>lua require('crates').reload<CR>", desc = "Reload" },
      { "<leader>rv", "<cmd>lua require('crates').show_versions_popup<CR>", desc = "Show Versions" },
      { "<leader>rf", "<cmd>lua require('crates').show_features_popup<CR>", desc = "Show Features" },
      { "<leader>rD", "<cmd>lua require('crates').show_dependencies_popup<CR>", desc = "Show Dependencies" },
      { "<leader>ru", "<cmd>lua require('crates').update_crate<CR>", desc = "Update Crate" },
      { "<leader>ra", "<cmd>lua require('crates').update_all_crates<CR>", desc = "Update All Crates" },
      { "<leader>rU", "<cmd>lua require('crates').upgrade_crate<CR>", desc = "Upgrade Crate" },
      { "<leader>rA", "<cmd>lua require('crates').upgrade_all_crates<CR>", desc = "Upgrade All Crates" },
      { "<leader>re", "<cmd>lua require('crates').expand_plain_crate_to_inline_table<CR>", desc = "Expand Crate" },
      { "<leader>rE", "<cmd>lua require('crates').extract_crate_into_table<CR>", desc = "Extract Crate" },
    },
  },
}
