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
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults.winblend = 00
      return opts
    end,
  },
  -- {
  --   "nanotee/sqls.nvim",
  --   lazy = false,
  --   filetype = "sql",
  --   config = function()
  --     require("lspconfig").sqls.setup {
  --       on_attach = function(client, bufnr) require("sqls").on_attach(client, bufnr) end,
  --     }
  --   end,
  -- },
}
