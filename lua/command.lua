local function inspect_lsp_config()
  local clients = vim.lsp.get_clients { bufnr = 0 } -- 获取当前缓冲区的活动 LSP 客户端
  if #clients == 0 then
    print "No active LSP clients for this buffer."
    return
  end

  -- 构建一个选项列表供用户选择
  local client_names = {}
  for _, client in ipairs(clients) do
    table.insert(client_names, client.name)
  end

  -- 使用 vim.ui.select 创建一个交互式菜单
  vim.ui.select(client_names, { prompt = "Select an LSP client:" }, function(choice)
    if not choice then
      print "No client selected."
      return
    end

    -- 找到选择的客户端并提取配置信息
    for _, client in ipairs(clients) do
      if client.name == choice then
        -- 构造配置信息
        local config_info = vim.inspect {
          name = client.name,
          root_dir = client.config.root_dir,
          filetypes = client.config.filetypes,
          settings = client.config.settings,
          capabilities = client.server_capabilities,
        }

        -- 创建右侧窗口并显示配置信息
        local buf = vim.api.nvim_create_buf(false, true) -- 创建一个新的未命名缓冲区
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(config_info, "\n")) -- 写入内容

        -- 在右侧创建一个窗口
        local width = math.floor(vim.o.columns * 0.4) -- 窗口宽度为屏幕的 40%
        vim.cmd "vsplit"
        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(win, buf)
        vim.api.nvim_win_set_width(win, width)

        -- 设置缓冲区为只读
        vim.bo[buf].modifiable = false
        vim.bo[buf].filetype = "lua"

        return
      end
    end
  end)
end

-- 将函数绑定到一个命令或快捷键
vim.api.nvim_create_user_command("InspectLspConfig", inspect_lsp_config, {})
