local function dispatch_theme_by_time(dawn, day, dusk, night)
  local hr = tonumber(os.date("%H", os.time()))

  if hr > 6 and hr <= 9 then
    return dawn
  elseif hr > 9 and hr <= 17 then
    return day
  elseif hr > 17 and hr <= 20 then
    _G.isMoon = true
    return dusk
  else
    return night
  end
end

local function choose_sheme(theme)
  if theme == "tokyonight" then
    --
    -- tokyonight-day
    -- tokyonight-moon, tokyonight-storm
    -- tokyonight-night
    return dispatch_theme_by_time("tokyonight-day", "tokyonight-day", "tokyonight-moon", "tokyonight-night")
  elseif theme == "catppuccin" then
    --
    -- catppuccin-latte
    -- catppuccin-frappe, catppuccin-macchiato
    -- catppuccin-mocha
    return dispatch_theme_by_time("catppuccin-latte", "catppuccin-latte", "catppuccin-macchiato", "catppuccin-mocha")
  elseif theme == "fox" then
    -- dawnfox
    -- dayfox
    -- duskfox, nordfox, terafox
    -- nightfox, carbonfox
    return dispatch_theme_by_time("dawnfox", "dayfox", "duskfox", "nightfox")
  elseif theme == "rose" then
    -- rose-pine-dawn
    --
    -- rose-pine-moon
    -- rose-pine-main
    return dispatch_theme_by_time("rose-pine-dawn", "rose-pine-dawn", "rose-pine-moon", "rose-pine-main")
  elseif theme == "astro" then
    --
    -- astrolight
    -- astromars
    -- astrodark
    return dispatch_theme_by_time("astrolight", "astrolight", "astromars", "astrodark")
  end
end

local function random_sheme(dawns, days, dusks, nights)
  math.randomseed(os.time()) -- 初始化随机数种子

  local dawn = dawns[math.random(#dawns)]
  local day = days[math.random(#days)]
  local dusk = dusks[math.random(#dusks)]
  local night = nights[math.random(#nights)]

  return dispatch_theme_by_time(dawn, day, dusk, night)
end

return random_sheme(
  { "tokyonight-day", "catppuccin-latte", "dawnfox", "rose-pine-dawn" },
  { "tokyonight-day", "catppuccin-latte", "dayfox", "rose-pine-dawn" },
  { "tokyonight-moon", "catppuccin-macchiato", "duskfox", "rose-pine-moon" },
  { "tokyonight-night", "catppuccin-mocha", "nightfox", "rose-pine-main" }
)
-- return choose_sheme("catppuccin")
