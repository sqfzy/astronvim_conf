local dir_exists = function(file)
  local ok, _, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok
end

return {
  "simrat39/rust-tools.nvim",
  lazy = false,
  opts = {
    server = {
      on_attach = function(_, bufnr) end,
    },
  },
  config = function(_, opts)
    local status_ok, rust_tools = pcall(require, "rust-tools")
    if not status_ok then return end

    local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/")
    local vscode_path = vim.fn.expand "~/" .. ".vscode/extensions/vadimcn.vscode-lldb-1.8.1/"

    local path = ""
    local debugger_found = true
    if dir_exists(mason_path) then
      path = mason_path
    elseif dir_exists(vscode_path) then
      path = vscode_path
    else
      debugger_found = false
      vim.notify("please install codelldb using :Mason or via vscode", vim.log.levels.WARN)
    end

    if debugger_found then
      local codelldb_path = path .. "adapter/codelldb"
      local liblldb_path = path .. "lldb/lib/liblldb.so"

      if vim.fn.has "mac" == 1 then liblldb_path = path .. "lldb/lib/liblldb.dylib" end

      if vim.fn.filereadable(codelldb_path) and vim.fn.filereadable(liblldb_path) then
        opts.dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        }
      else
        vim.notify("please reinstall codellb, i cannot find liblldb or codelldb itself", vim.log.levels.WARN)
      end
    end
    rust_tools.setup(opts)
  end,
}
