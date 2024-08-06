local function random_from_table(table)
  math.randomseed(os.time()) -- 初始化随机数种子
  if #table == 0 then return nil end
  return table[math.random(#table)]
end

local themes = {
  tokyonight = {
    dawns = { "tokyonight-day" },
    days = { "tokyonight-day" },
    dusk = { "tokyonight-moon", "tokyonight-storm" },
    night = { "tokyonight-night" },
  },

  catppuccin = {
    dawns = { "catppuccin-latte" },
    days = { "catppuccin-latte" },
    dusk = { "catppuccin-macchiato", "catppuccin-frappe" },
    night = { "catppuccin-mocha" },
  },

  fox = {
    dawns = { "dawnfox" },
    days = { "dayfox" },
    dusk = { "duskfox", "nordfox" },
    night = { "nightfox", "terafox", "carbonfox" },
  },

  rose = {
    dawns = { "rose-pine-dawn" },
    days = { "rose-pine-dawn" },
    dusk = { "rose-pine-moon" },
    night = { "rose-pine-main" },
  },

  everforest = {
    dawns = { "everforest" },
    days = { "everforest" },
    dusk = { "everforest" },
    night = { "everforest" },
  },

  kanagawa = {
    dawns = { "kanagawa-lotus" },
    days = { "kanagawa-lotus" },
    dusk = { "kanagawa-wave" },
    night = { "kanagawa-dragon" },
  },

  osaka = {
    dawns = {},
    days = {},
    dusk = {},
    night = { "solarized-osaka" },
  },
}
local function choose_theme_by_time(scheme)
  local hr = tonumber(os.date("%H", os.time()))

  if hr > 6 and hr <= 9 then
    vim.opt.background = "light"
    return random_from_table(scheme.dawn)
  elseif hr > 9 and hr <= 16 then
    vim.opt.background = "light"
    return random_from_table(scheme.day)
  elseif hr > 16 and hr <= 21 then
    vim.opt.background = "dark"
    return random_from_table(scheme.dusk)
  else
    vim.opt.background = "dark"
    return random_from_table(scheme.night)
  end
end

local function choose_theme_by_time_from_all(scheme)
  local hr = tonumber(os.date "%H")
  local time_of_day

  if hr > 6 and hr <= 9 then
    vim.opt.background = "light"
    time_of_day = "dawns"
  elseif hr > 9 and hr <= 16 then
    vim.opt.background = "light"
    time_of_day = "days"
  elseif hr > 16 and hr <= 21 then
    vim.opt.background = "dark"
    time_of_day = "dusk"
  else
    vim.opt.background = "dark"
    time_of_day = "night"
  end

  local all_themes = {}
  for _, v in pairs(scheme) do
    for _, theme in ipairs(v[time_of_day]) do
      table.insert(all_themes, theme)
    end
  end

  return random_from_table(all_themes)
end

return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = choose_theme_by_time_from_all(themes),
    },
  },
  { "folke/tokyonight.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "savq/melange-nvim" },
  { "sainnhe/everforest" },
  { "rebelot/kanagawa.nvim" },
  { "craftzdog/solarized-osaka.nvim" },
  { "olimorris/onedarkpro.nvim" },
  { "navarasu/onedark.nvim" },
}
