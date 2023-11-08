return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  -- { import = "astrocommunity.pack.html-css" },
  -- { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.typescript-deno" },
  { import = "astrocommunity.pack.toml" },
  -- { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.proto" },

  -- { import = "astrocommunity.test.neotest" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
}
