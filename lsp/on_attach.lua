return function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    bufnr = bufnr or 0
    vim.b[bufnr].inlay_hints_enabled = not vim.b[bufnr].inlay_hints_enabled
    if vim.lsp.inlay_hint then vim.lsp.inlay_hint(bufnr, vim.b[bufnr].inlay_hints_enabled) end
  end
end
