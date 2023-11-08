return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- {
  --   "mg979/vim-visual-multi",
  --   event = "BufRead",
  -- }, -- 多光标
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "adoyle-h/lsp-toggle.nvim",
    cmd = { "ToggleLSP", "ToggleNullLSP" },
    opts = {
      create_cmds = true, -- Whether to create user commands
      telescope = true, -- Whether to load telescope extensions
    },
  },
}
