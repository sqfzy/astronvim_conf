return {
  n = {
    -- this mapping will only be set in buffers with an LSP attached
    K = false,
    ["<A-k>"] = {
      function()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ "vim", "help" }, filetype) then
          vim.cmd("h " .. vim.fn.expand "<cword>")
        elseif vim.tbl_contains({ "man" }, filetype) then
          vim.cmd("Man " .. vim.fn.expand "<cword>")
        elseif vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
          require("crates").show_popup()
        elseif vim.fn.expand "%:e" == "rs" then
          vim.cmd "RustHoverActions"
        else
          vim.lsp.buf.hover()
        end
      end,
      desc = "Hover symbol details",
    },

    ["[D"] = {
      function() vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR } end,
      desc = "Previous diagnostic",
    },
    ["]D"] = {
      function() vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR } end,
      desc = "Next diagnostic",
    },
  },
}
