return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "smoka7/hydra.nvim",
  },
  opts = {
    DEBUG_MODE = false,
    create_commands = true, -- create Multicursor user commands
    updatetime = 50, -- selections get updated if this many milliseconds nothing is typed in the insert mode see :help updatetime
    nowait = true, -- see :help :map-nowait
    -- normal_keys = {},
    -- insert_keys = {},
    -- extend_keys = extend_keys,
    -- see :help hydra-config.hint
    -- hint_config = {
    --   border = "none",
    --   position = "bottom",
    -- },
    hint_config = false,
    -- accepted values:
    -- -1 true: generate hints
    -- -2 false: don't generate hints
    -- -3 [[multi line string]] provide your own hints
    generate_hints = {
      normal = false,
      insert = false,
      extend = false,
    },
  },
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    {
      mode = { "v", "n" },
      "<leader>m",
      "<cmd>MCstart<cr>",
      desc = "Multi cursor start",
    },
  },
}
