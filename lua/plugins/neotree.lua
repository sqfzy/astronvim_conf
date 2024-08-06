return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["<A-h>"] = "prev_source",
        ["<A-l>"] = "next_source",
      },
    },
  },
  keys = {
    { "<leader>n", desc = "Neo tree" },
    { "<leader>nh", "<cmd>Neotree ~/<CR>", desc = "Home" },
    { "<leader>nc", "<cmd>Neotree ~/work_space/<CR>", desc = "code dir" },
    { "<leader>na", "<cmd>Neotree ~/.config/nvim/<CR>", desc = "astronvim dir" },
  },
}
