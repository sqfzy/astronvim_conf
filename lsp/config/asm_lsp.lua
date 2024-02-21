return {
  cmd = { "asm-lsp" },
  filetypes = { "asm, vmasm" },
  root_dir = require("lspconfig.util").root_pattern(".git", "Makefile", "build"),
}
