return {
  cmd = { "deno", "lsp" },
  cmd_env = {
    NO_COLOR = true,
  },
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "markdown",
  },
  -- init_options = {
  --   config = "./deno.json",
  --   lint = true,
  -- },
  root_dir = function(fname)
    local root_patterns = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc", "tsconfig.json", ".git")
    local root_dir = root_patterns(fname)

    if root_dir and root_dir:find "work_code" then
      return root_dir
    else
      return nil
    end
  end,
  settings = {
    deno = {
      enable = true,
      suggest = {
        imports = {
          hosts = {
            ["https://crux.land"] = true,
            ["https://deno.land"] = true,
            ["https://x.nest.land"] = true,
          },
        },
      },
    },
  },
}
