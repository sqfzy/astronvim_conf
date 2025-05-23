-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

local denols_config = {
  deno = {
    enable = true, -- 启用Deno语言服务器
    lint = true, -- 启用代码检查
    unstable = false, -- 是否启用不稳定API支持
    -- importMap = "./import_map.json", -- 指定导入映射文件的路径
    config = "./deno.json", -- 引用 deno.json 配置文件
    suggest = {
      autoImports = true, -- 启用自动导入建议
      imports = {
        hosts = {
          ["https://deno.land"] = true, -- 启用从deno.land导入的建议
          ["https://cdn.deno.land"] = true,
        },
      },
    },
    codeLens = {
      implementations = true, -- 启用实现的代码透镜
      references = true, -- 启用引用的代码透镜
      test = true, -- 启用测试的代码透镜
    },
  },
}

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true, -- enable or disable auto formatting on start
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
      -- "fish_lsp",
      -- "ark",
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
      -- rust_analyzer = rust_analyzer_config,
      -- denols = denols_config,

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
    lsp_handlers = {
      -- ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", silent = true }),
      -- ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      lsp_document_highlight = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/documentHighlight",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        -- {
        --   -- events to trigger
        --   event = { "CursorHold", "CursorHoldI" },
        --   -- the rest of the autocmd options (:h nvim_create_autocmd)
        --   desc = "Document Highlighting",
        --   callback = function() vim.lsp.buf.document_highlight() end,
        -- },
        -- {
        --   event = { "CursorMoved", "CursorMovedI", "BufLeave" },
        --   desc = "Document Highlighting Clear",
        --   callback = function() vim.lsp.buf.clear_references() end,
        -- },
        -- {
        --   event = {"ColorScheme"},
        --   callback = function()
        --     vim.api.nvim_set_hl(0, 'LspReferenceTarget', {})
        --   end,
        -- }
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },

        -- K = "<Nop>",
        ["<A-k>"] = { function() vim.lsp.buf.hover({
          border = "rounded"
        }) end, desc = "Hover" },
        -- ["<A-d>"] = {function() vim.lsp.buf.definition() end, desc = "Definition"},
        -- ["<A-D>"] = {function() vim.lsp.buf.declaration() end, desc = "Declaration"},
        -- ["<A-i>"] = {function() vim.lsp.buf.implementation() end, desc = "Implementation"},
        -- ["<A-t>"] = {function() vim.lsp.buf.type_definition() end, desc = "Type Definition"},
        -- ["<A-r>"] = {function() vim.lsp.buf.references() end, desc = "References"},
        -- ["<A-s>"] = {function() vim.lsp.buf.signature_help() end, desc = "Signature Help"},
        -- ["<A-a>"] = {function() vim.lsp.buf.code_action() end, desc = "Code Action"},
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

        ["[D"] = {
          function() vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR } end,
          desc = "Previous diagnostic",
        },
        ["]D"] = {
          function() vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR } end,
          desc = "Next diagnostic",
        },
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        -- gD = {
        --   function() vim.lsp.buf.declaration() end,
        --   desc = "Declaration of current symbol",
        --   cond = "textDocument/declaration",
        -- },
        -- ["<Leader>uY"] = {
        --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        --   desc = "Toggle LSP semantic highlight (buffer)",
        --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        -- },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
