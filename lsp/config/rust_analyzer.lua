return {
  settings = {
    ["rust-analyzer"] = {

      ["imports.granularity.enforce"] = true,
      check = {
        -- ignore = (_G.isMoon and vim.cmd "colorscheme" == "tokyonight") and {}
        --   or { "dead_code", "unused_imports", "unused_variables" },
        -- { "dead_code", "unused_imports" },
      },
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
            ["Result"] = {
              postfix = "resu",
              body = "Result<${receiver}>",
              description = "Wrap the expression in a `Result`",
              scope = "expr",
              -- for Snippet-Scopes: expr, item (default: item)
              -- for Postfix-Snippet-Scopes: expr, type (default: expr)
            },
            ["Ok"] = {
              postfix = "ok",
              body = "Ok(${receiver})",
              description = "Wrap the expression in a `Result::Ok`",
              scope = "expr",
            },
            ["Err"] = {
              postfix = "err",
              body = "Err(${receiver})",
              description = "Wrap the expression in a `Result::Err`",
              scope = "expr",
            },
            ["Option"] = {
              postfix = "opt",
              body = "Option<${receiver}>",
              description = "Wrap the expression in a `Option`",
              scope = "expr",
            },
            ["Some"] = {
              postfix = "some",
              body = "Some(${receiver})",
              description = "Wrap the expression in a `Option:Some`",
              scope = "expr",
            },
            ["Deref"] = {
              postfix = "def",
              body = "*${receiver}",
              scope = "expr",
            },
            ["DerefMut"] = {
              postfix = "defm",
              body = "*mut ${receiver}",
              scope = "expr",
            },
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
        -- expressionAdjustmentHints = {
        --   enable = true,
        -- },
        lifetimeElisionHints = {
          enable = true,
        },
      },
      lens = {
        references = {
          adt = {
            -- enable = true,
          },
          enumVariant = {
            -- enable = true,
          },
          method = {
            -- enable = true,
          },
          trait = {
            -- enable = true,
          },
        },
      },
      hover = {
        memoryLayout = {
          niches = true,
        },
      },
      cargo = {
        extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
        extraArgs = { "--profile", "rust-analyzer" },
      },
    },
  },
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = function(fname)
    local root_patterns = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json")
    local root_dir = root_patterns(fname)

    -- 检查 root_dir 是否在特定目录下
    if root_dir and root_dir:find "work_code" then
      return root_dir
    else
      return nil
    end
  end,
}
