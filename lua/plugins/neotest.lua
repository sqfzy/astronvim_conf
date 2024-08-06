return {
  "nvim-neotest/neotest",
  opts = function(_, opts)
    if not opts.adapters then opts.adapters = {} end
    local rustaceanvim_avail, rustaceanvim = pcall(require, "rustaceanvim.neotest")
    if rustaceanvim_avail then table.insert(opts.adapters, rustaceanvim) end
    return opts
  end,
}
