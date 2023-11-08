local hr = tonumber(os.date("%H", os.time()))
if hr > 6 and hr < 18 then
  -- return "rose-pine-dawn"
  return "tokyonight-day"
  -- return "dayfox"
  -- return "catppuccin-latte"
  -- return "astrolight"
else
  -- return "rose-pine-moon"
  return "tokyonight-moon"
  -- return "duskfox"
  -- return "catppuccin-macchiato"
  -- return "astrodark"
end
