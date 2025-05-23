local settings = {
  ["rust-analyzer"] = {
    -- ["imports.granularity.enforce"] = true,
    -- check = {
    --   -- ignore = (_G.isMoon and vim.cmd "colorscheme" == "tokyonight") and {}
    --   --   or { "dead_code", "unused_imports", "unused_variables" },
    --   -- { "dead_code", "unused_imports" },
    -- },
    checkOnSave = {
      allFeatures = true,
      command = "clippy",
      extraArgs = { "--no-deps" },
    },
    completion = {
      snippets = {
        custom = {
          -- "Arc::new": {
          --     "postfix": "arc",
          --     "body": "Arc::new(${receiver})",
          --     "requires": "std::sync::Arc",
          --     "description": "Put the expression into an `Arc`",
          --     "scope": "expr"
          -- },
          -- ["Deref"] = {
          --   postfix = "def",
          --   body = "*${receiver}",
          --   scope = "expr",
          -- },
          -- ["DerefMut"] = {
          --   postfix = "defm",
          --   body = "*mut ${receiver}",
          --   scope = "expr",
          -- },
        },
      },
    },
    inlayHints = {
      closureCaptureHints = {
        enable = true,
      },
      discriminantHints = {
        enable = true,
      },
      expressionAdjustmentHints = {
        -- enable = true,
      },
      lifetimeElisionHints = {
        enable = true,
      },
    },
    lens = {
      references = {
        adt = {
          enable = true,
        },
        enumVariant = {
          enable = true,
        },
        method = {
          enable = true,
        },
        trait = {
          enable = true,
        },
      },
    },
    hover = {
      -- memoryLayout = {
      --   niches = true,
      -- },
    },
    cargo = {
      extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
      extraArgs = { "--profile", "rust-analyzer" },
    },
  },

  -- root_dir = function(fname)
  --   local root_patterns = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json")
  --   local root_dir = root_patterns(fname)
  --
  --   -- vim.print(root_dir)
  --   if root_dir and root_dir:find "demo_code" then
  --     return nil
  --   else
  --     return root_dir
  --   end
  -- end,

  single_file_support = true,
}

return {
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server.default_settings = settings
      opts.tools = {
        float_win_config = {
          border = "rounded",
        },
      }
    end,
  },
}
