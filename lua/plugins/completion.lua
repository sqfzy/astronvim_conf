local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

return { -- override nvim-cmp plugin
  {
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the mapping part of the table
      opts.mapping["<A-n>"] = cmp.mapping.select_next_item()
      opts.mapping["<A-p>"] = cmp.mapping.select_prev_item()
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if has_words_before() then
          cmp.confirm { select = true }
        else
          fallback()
        end
      end, { "i", "s" })
      -- opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      --   if has_words_before() then
      --     cmp.confirm { select = true }
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" })
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      require("luasnip.loaders.from_lua").lazy_load { paths = { "./snippets/luasnippets" } }
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "/snippets/vscode/" }, exclude = { "rust" } }
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules {

        -- 注释
        Rule("/* ", " */", { "c", "cpp", "css", "javascript", "php", "rust" }):with_pair(cond.not_inside_quote()),
        Rule("//", " ", { "c", "cpp", "javascript", "php", "rust" })
          :with_pair(cond.not_inside_quote())
          :replace_endpair(function(opts)
            local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
            if prev_2char:match "^/" then
              return "<bs><bs>// "
            elseif prev_2char:match "^%S" then
              return "<bs><bs> // "
            else
              return "<bs><bs>// "
            end
          end)
          :set_end_pair_length(0),
        Rule("// /", "", { "rust" })
          :with_pair(cond.not_inside_quote)
          :replace_endpair(function() return "<bs><bs>/ " end)
          :set_end_pair_length(0),
        Rule("// !", "", { "rust" })
          :with_pair(cond.not_inside_quote)
          :replace_endpair(function() return "<bs><bs>! " end)
          :set_end_pair_length(0),
        Rule("#", "", { "python" })
          :with_pair(cond.not_inside_quote())
          :replace_endpair(function(opts)
            local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
            if prev_2char == "" then
              return " "
            elseif prev_2char == "  " then
              return " "
            elseif prev_2char:match "#" then
              return ""
            elseif prev_2char:match "%S%s" then
              return "<bs> # "
            elseif prev_2char:match "%S$" then
              return "<bs>  # "
            else
              return ""
            end
          end)
          :set_end_pair_length(0),
        Rule("<>", "", { "rust", "cpp", "c", "html", "lua" }):with_pair(cond.none):set_end_pair_length(1),
        Rule("||", "", { "rust" }):with_pair(cond.none):set_end_pair_length(1),
        -- \t  \n
        Rule("\\t", "", { "c", "cpp", "php", "python" })
          :with_pair(cond.not_inside_quote())
          :replace_endpair(function() return "<bs><bs>'\\t'" end)
          :set_end_pair_length(0),
      }
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = {
      panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },

      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<A-m>",
          accept_word = false,
          accept_line = false,
          next = "<A-n>",
          prev = "<A-p>",
          -- dismiss = "<leader>cE",
        },
        -- keymap = {
        -- 	accept = "<M-l>",
        -- 	accept_word = false,
        -- 	accept_line = false,
        -- 	next = "<M-]>",
        -- 	prev = "<M-[>",
        -- 	dismiss = "<C-]>",
        -- },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = true,
      },
      copilot_node_command = "node", -- Node.js version must be > 16.x
      server_opts_overrides = {},
    },
  },
}
