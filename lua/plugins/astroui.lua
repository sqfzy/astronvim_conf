-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = {ctermbg = 0},
        -- LspReferenceText = {  guisp = "#b8b8b8" },
        TelescopeNormal = { ctermbg = 0 },
        TelescopeBorder = { ctermbg = 0 },
        TelescopePromptNormal = { ctermbg = 0 },
        TelescopePromptBorder = { ctermbg = 0 },
        TelescopePromptTitle = { ctermbg = 0 },
        TelescopeMultiSelection = { ctermbg = 0 },
        TelescopeSelection = { ctermbg = 0 },
        -- TelescopePromptTitle = { ctermbg = 0 },
        -- TelescopePromptTitle = { ctermbg = 0 },
        -- TelescopePromptTitle = { ctermbg = 0 },
        NeoTreeNormal = { ctermbg = 0 },
        NeoTreeNormalNC = { ctermbg = 0 },
        NeoTreeFloatNormal = { ctermbg = 0 },
        NeoTreeFloatTitle = { ctermbg = 0 },
        NeoTreeFloatBorder = { ctermbg = 0 },
        TerminalNormal = { ctermbg = 0 },
        TerminalBorder = { ctermbg = 0 },
        WinBar = { ctermbg = 0 },
        WinBarNC = { ctermbg = 0 },
        TabLine = { ctermbg = 0 }, -- tab not choose
        TabLineFill = { ctermbg = 0 },
        TabLineSel = { ctermbg = 0 }, -- tab choosed
        Float = { ctermbg = 0 },
        FloatBorder = { ctermbg = 0 },
        NormalFloat = { ctermbg = 0 },
        StatusLine = { ctermbg = 0 },
        StatusLineNC = { ctermbg = 0 },
        WhichKeyFloat = { ctermbg = 0 },
        WhichKeyBorder = { ctermbg = 0 },
        FloatTitle = { ctermbg = 0 },
        LspInlayHint = { fg = "#848cb5" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
      tokyonight = {
        -- link = "@Comment",
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      ActiveLSP = "",
      ActiveTS = " ",
      BufferClose = "",
      DapBreakpoint = "",
      DapBreakpointCondition = "",
      DapBreakpointRejected = "",
      DapLogPoint = "",
      DapStopped = "",
      DefaultFile = "",
      Diagnostic = "",
      DiagnosticError = "",
      DiagnosticHint = "",
      DiagnosticInfo = "",
      DiagnosticWarn = "",
      Ellipsis = "",
      FileModified = "",
      FileReadOnly = "",
      FoldClosed = "",
      FoldOpened = "",
      FolderClosed = "",
      FolderEmpty = "",
      FolderOpen = "",
      Git = "",
      GitAdd = "",
      GitBranch = "",
      GitChange = "",
      GitConflict = "",
      GitDelete = "",
      GitIgnored = "",
      GitRenamed = "",
      GitStaged = "",
      GitUnstaged = "",
      GitUntracked = "",
      LSPLoaded = "",
      LSPLoading1 = "",
      LSPLoading2 = "",
      LSPLoading3 = "",
      MacroRecording = "",
      Paste = "",
      Search = "",
      Selected = "",
      TabClose = "",
    },
  },
}
