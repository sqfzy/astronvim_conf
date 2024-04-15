return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    enabled = false,
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
}
