-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local rust_settings = {
  ["rust-analyzer"] = {
    -- ["imports.granularity.enforce"] = true,
    -- check = {
    --   -- ignore = (_G.isMoon and vim.cmd "colorscheme" == "tokyonight") and {}
    --   --   or { "dead_code", "unused_imports", "unused_variables" },
    --   -- { "dead_code", "unused_imports" },
    -- },
    -- checkOnSave = {
    --   allFeatures = true,
    --   command = "clippy",
    --   extraArgs = { "--no-deps" },
    -- },
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
}

---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      -- Configuration table of features provided by AstroLSP
      features = {
        codelens = true, -- enable/disable codelens refresh on start
        inlay_hints = true, -- enable/disable inlay hints on start
        semantic_tokens = true, -- enable/disable semantic token highlighting
      },
      -- customize lsp formatting options
      formatting = {
        -- control auto formatting on save
        format_on_save = {
          enabled = false, -- enable or disable format on save globally
          allow_filetypes = { -- enable format on save for specified filetypes only
            -- "go",
          },
          ignore_filetypes = { -- disable format on save for specified filetypes
            -- "python",
          },
        },
        disabled = { -- disable formatting capabilities for the listed language servers
          -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
          -- "lua_ls",
        },
        timeout_ms = 1000, -- default format timeout
        -- filter = function(client) -- fully override the default formatting function
        --   return true
        -- end
      },
      -- enable servers that you already have installed without mason
      servers = {
        -- "pyright"
      },
      -- customize language server configuration options passed to `lspconfig`
      ---@diagnostic disable: missing-fields
      config = {
        tinymist = {
          single_file_support = true,
        },
        fish_lsp = {
          command = "fish-lsp",
          filetypes = { "fish" },
          args = { "start" },
        },
        -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
      },
      -- customize how language servers are attached
      handlers = {
        -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
        -- function(server, opts) require("lspconfig")[server].setup(opts) end

        -- the key is the server that is being setup with `lspconfig`
        -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
        -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
      },
      -- Configure buffer local auto commands to add when attaching a language server
      autocmds = {
        -- first key is the `augroup` to add the auto commands to (:h augroup)
        lsp_codelens_refresh = {
          -- Optional condition to create/delete auto command group
          -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
          -- condition will be resolved for each client on each execution and if it ever fails for all clients,
          -- the auto commands will be deleted for that buffer
          cond = "textDocument/codeLens",
          -- cond = function(client, bufnr) return client.name == "lua_ls" end,
          -- list of auto commands to set
          {
            -- events to trigger
            event = { "InsertLeave", "BufEnter" },
            -- the rest of the autocmd options (:h nvim_create_autocmd)
            desc = "Refresh codelens (buffer)",
            callback = function(args)
              if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
            end,
          },
        },
      },
      -- mappings to be set up on attaching of a language server
      mappings = {
        n = {
          gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },

          ["<A-k>"] = {
            function()
              vim.lsp.buf.hover {
                border = "rounded",
              }
            end,
            desc = "Hover",
          },

          ["<Leader>lR"] = {
            function() require("snacks").picker.lsp_references() end,
            desc = "References",
          },

          ["<Leader>ls"] = {
            function() require("snacks").picker.lsp_symbols() end,
            desc = "Symbols",
          },

          ["<Leader>lS"] = {
            function() require("snacks").picker.lsp_workspace_symbols() end,
            desc = "Workspace Symbols",
          },

          ["<Leader>lc"] = {
            function() require("snacks").picker.lsp_config() end,
            desc = "Lsp Config",
          },

          -- ["<A-d>"] = {function() vim.lsp.buf.definition() end, desc = "Definition"},
          -- ["<A-D>"] = {function() vim.lsp.buf.declaration() end, desc = "Declaration"},
          -- ["<A-i>"] = {function() vim.lsp.buf.implementation() end, desc = "Implementation"},
          -- ["<A-t>"] = {function() vim.lsp.buf.type_definition() end, desc = "Type Definition"},
          -- ["<A-s>"] = {function() vim.lsp.buf.signature_help() end, desc = "Signature Help"},
          -- ["<Leader>la"] = { function() vim.lsp.buf.code_action() end, desc = "Code Action" },
          -- ["<A-f>"] = {function() vim.lsp.buf.formatting() end, desc = "Format"},
          -- ["<A-n>"] = {function() vim.lsp.diagnostic.goto_next() end, desc = "Next Diagnostic"},
          -- ["<A-p>"] = {function() vim.lsp.diagnostic.goto_prev() end, desc = "Previous Diagnostic"},
          -- ["<A-l>"] = {function() vim.lsp.diagnostic.show_line_diagnostics() end, desc = "Line Diagnostics"},
          -- ["<A-L>"] = {function() vim.lsp.diagnostic.set_loclist() end, desc = "Set Loclist"},
          -- ["<A-o>"] = {function() vim.lsp.diagnostic.open_float() end, desc = "Open Diagnostics"},
          -- ["<A-O>"] = {function() vim.lsp.diagnostic.close_float() end, desc = "Close Diagnostics"},
          -- ["<A-c>"] = {function() vim.lsp.buf.clear_references() end, desc = "Clear References"},
          -- ["<A-C>"] = {function() vim.lsp.buf.clear_references() end, desc = "Clear References"},
          -- ["<A-w>"] = {function() vim.lsp.buf.workspace_symbol() end, desc = "Workspace Symbol"},
          -- ["<A-W>"] = {function() vim.lsp.buf.document_symbol() end, desc = "Document Symbol"},
          -- ["<A-x>"] = {function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end, desc = "Stop LSP"},
          -- ["<A-X>"] = {function() vim.lsp.stop_client(vim.lsp.get_active_clients()) end, desc = "Stop LSP"},
          -- ["<A-q>"] = {function() vim.lsp.buf.rename() end, desc = "Rename"},
          -- ["<A-Q>"] = {function() vim.lsp.buf.rename() end, desc = "Rename"},
          -- ["<A-z>"] = {function() vim.lsp.buf.code_lens_action() end, desc = "Code Lens"},
          -- ["<A-Z>"] = {function() vim.lsp.buf.code_lens_action() end, desc = "Code Lens"},
          -- ["<A-g>"] = {function() vim.lsp.buf.document_highlight() end, desc = "Document Highlight"},
          -- ["<A-G>"] = {function() vim.lsp.buf.document_highlight() end, desc = "Document Highlight"},
          -- ["<A-e>"] = {function() vim.lsp.buf.code_action() end, desc = "Code Action"},
          -- ["<A-E>"] = {function() vim.lsp.buf.code_action() end, desc = "Code Action"},
          -- ["<A-v>"] = {function() vim.lsp.buf.definition() end, desc = "Definition"},
          -- ["<A-V>"] = {function() vim.lsp.buf.definition() end, desc = "Definition"},
          -- ["<A-m>"] = {function() vim.lsp.buf.implementation() end, desc = "Implementation"},
          -- ["<A-M>"] = {function() vim.lsp.buf.implementation() end, desc = "Implementation"},
          -- ["<A-y>"] = {function() vim.lsp.buf.type_definition() end, desc = "Type Definition"},
          -- ["<A-Y>"] = {function() vim.lsp.buf.type_definition() end, desc = "Type Definition"},
          -- ["<A-u>"] = {function() vim.lsp.buf.references() end, desc = "References"},
          -- ["<A-U>"] = {function() vim.lsp.buf.references() end, desc = "References"},
          -- ["<A-h>"] = {function() vim.lsp.buf.signature_help() end, desc = "Signature Help"},
          -- ["<A-H>"] = {function() vim.lsp.buf.signature_help()
        },
      },
      -- A custom `on_attach` function to be run after the default `on_attach` function
      -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
      on_attach = function(client, bufnr)
        -- this would disable semanticTokensProvider for all clients
        -- client.server_capabilities.semanticTokensProvider = nil
      end,
    },
  },

  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server = {
        default_config = rust_settings,
        root_dir = function(fname)
          local root_patterns = require("lspconfig").util.root_pattern("Cargo.toml", "rust-project.json")
          local root_dir = root_patterns(fname)

          if root_dir and root_dir:find "demo_code" then
            return nil
          else
            return root_dir
          end
        end,
        single_file_support = true,
      }

      opts.tools = {
        float_win_config = {
          border = "rounded",
        },
      }
    end,
  },
}
