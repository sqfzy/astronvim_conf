-- 文件路径: ~/.config/nvim/lua/user/init.lua
-- 或者 ~/.config/nvim/lua/user/custom_lsp_toggle.lua (如果选择分离文件)

-- 1. 初始化全局 LSP 启用状态
-- 默认设置为 true (启用)
if vim.g.lsp_globally_enabled == nil then
  vim.g.lsp_globally_enabled = true
end

-- 2. 备份并覆盖 vim.lsp.start_client
--    确保这个覆盖操作只执行一次
if not _G.original_vim_lsp_start_client then
  _G.original_vim_lsp_start_client = vim.lsp.start_client
end

vim.lsp.start_client = function(config)
  -- 如果 LSP 全局禁用，则阻止客户端启动
  if vim.g.lsp_globally_enabled == false then
    vim.notify(
      "LSP globally disabled. Preventing start of: " .. (config and config.name or "unknown LSP"),
      vim.log.levels.WARN,
      { title = "LSP Toggle" }
    )
    return nil, nil -- 返回两个 nil (client_id, err)，表示启动失败
  end

  -- 如果 LSP 全局启用，则调用原始的启动函数
  if _G.original_vim_lsp_start_client then
    return _G.original_vim_lsp_start_client(config)
  else
    -- 这是一个备用逻辑，理论上不应该执行到这里
    vim.notify("Error: Original vim.lsp.start_client not found for LSP toggle.", vim.log.levels.ERROR)
    return nil, nil
  end
end

-- 3. 创建切换 LSP 全局状态的函数
function _G.toggle_global_lsp()
  vim.g.lsp_globally_enabled = not vim.g.lsp_globally_enabled

  if vim.g.lsp_globally_enabled then
    vim.notify("LSP globally ENABLED.", vim.log.levels.INFO, { title = "LSP Toggle" })
    vim.notify(
      "LSP will start for new/reopened files. In existing buffers, use :LspRestart or :LspStart if needed.",
      vim.log.levels.WARN,
      { title = "LSP Toggle" }
    )
    -- 当重新启用时，LSP 会在打开新文件或重新打开文件时自动根据 AstroNvim 的配置启动。
    -- 对于已经打开的缓冲区，AstroNvim (或 nvim-lspconfig) 通常有 :LspStart 或 :LspRestart 命令
    -- 来手动为当前缓冲区启动/重启 LSP。
  else
    vim.notify("LSP globally DISABLED.", vim.log.levels.INFO, { title = "LSP Toggle" })
    local clients = vim.lsp.get_active_clients()
    if #clients > 0 then
      vim.notify("Stopping " .. #clients .. " active LSP client(s)...", vim.log.levels.INFO, { title = "LSP Toggle" })
      for _, client in ipairs(clients) do
        -- client.stop() 也可以，但 vim.lsp.stop_client(client.id) 更通用
        pcall(vim.lsp.stop_client, client.id) -- 使用 pcall 避免潜在错误中断流程
      end
    else
      vim.notify("No active LSP clients to stop.", vim.log.levels.INFO, { title = "LSP Toggle" })
    end
  end
end

-- 4. 设置快捷键
--    你可以选择自己喜欢的快捷键，这里使用 <leader>lt (leader key 通常是空格或反斜杠)
--    `desc` 选项可以让你在使用 <leader> 后按 ? (或其他绑定到 `which-key` 的键) 时看到描述
vim.keymap.set("n", "<leader>lt", "<cmd>lua _G.toggle_global_lsp()<CR>", {
  noremap = true,
  silent = true,
  desc = "Toggle Global LSP Enabled/Disabled"
})

vim.notify("LSP Global Toggle configured. Press <leader>lt to use.", vim.log.levels.INFO, { title = "LSP Setup" })

-- 如果你把代码放在了单独的文件 (例如 custom_lsp_toggle.lua)，
-- 确保在 init.lua 中 require 它:
-- require("user.custom_lsp_toggle")
