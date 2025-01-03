-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  -- extension = {
  --   foo = "fooscript",
  -- },
  -- filename = {
  --   ["Foofile"] = "fooscript",
  -- },
  -- pattern = {
  --   ["~/%.config/foo/.*"] = "fooscript",
  -- },
}

require("nvim-web-devicons").set_icon {
  typ = {
    icon = "󰰤",
    color = "#239dad",
    cterm_color = "31", -- 用于终端的颜色编号
    name = "Typst", -- 图标名称，用于调试或扩展支持
  },
  mmd = {
    icon = "Y",
    color = "#fd366e",
    name = "Mmd",
  }
}

if vim.fn.isdirectory(vim.fn.expand "~/work_space/") == 0 then vim.fn.mkdir(vim.fn.expand "~/work_space/") end
vim.cmd("cd ~/work_space")

