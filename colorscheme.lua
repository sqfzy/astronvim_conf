local hr = tonumber(os.date("%H", os.time()))
_G.isDayTime = hr > 6 and hr < 18
if _G.isDayTime then
  -- return "rose-pine-dawn"
  -- return "tokyonight-day"
  -- return "dayfox"
  return "catppuccin-latte"
  -- return "astrolight"
else
  -- return "rose-pine-moon"
  -- return "tokyonight-moon"
  -- return "duskfox"
  return "catppuccin-macchiato"
  -- return "astrodark"
end
