return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      opts.indent.char = "╎"
      -- opts.scope = { injected_languages = true }
      opts.scope = { show_start = false, show_end = false, injected_languages = true }
    end,
  },
}
