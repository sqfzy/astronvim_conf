return {
  capabilities = {
    offsetEncoding = "utf-8",
  },
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_dir = function(fname)
    local root_patterns = require("lspconfig.util").root_pattern(
      ".clangd",
      ".clang-tidy",
      ".clang-format",
      "compile_commands.json",
      "compile_flags.txt",
      "configure.ac",
      ".git"
    )
    local root_dir = root_patterns(fname)

    -- 检查 root_dir 是否在特定目录下
    if root_dir and root_dir:find "work_code" then
      return root_dir
    else
      return nil
    end
  end,
}
