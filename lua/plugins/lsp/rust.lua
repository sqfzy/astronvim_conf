return {
  "mrcjkb/rustaceanvim",
  opts = function(_, opts)
    opts.tools = {
      hover_actions = {

        --- whether to replace Neovim's built-in `vim.lsp.buf.hover`.
        ---@type boolean
        replace_builtin_hover = false,
      },
    }
  end,
}
