local theme = require('config.theme')

local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
require('telescope').setup {
  defaults = {
    prompt_prefix = ' ',
    borderchars = theme.borderchars.preview,
    mappings = {
      i = {
        ["<ESC>"] = actions.close,
        ["<C-t>"] = trouble.open_with_trouble
      },
      n = {
        ["<C-t>"] = trouble.open_with_trouble
      },
    },
  }
}

-- Set used telescope theme based on operation
local themes = require 'telescope.themes'
require('dressing').setup {
  input = {
    border = theme.border,
    win_options = {
      winblend = 0,
    }
  },
  select = {
    get_config = function(opts)
      if opts.kind == 'codeaction' then
        return {
          telescope = themes.get_cursor {
            borderchars = theme.borderchars,
          },
        }
      elseif opts.kind == 'luasnip' then
        return {
          telescope = themes.get_cursor {
            borderchars = theme.borderchars,
          },
        }
      end
    end,
  },
}

-- Extensions
require('telescope').load_extension('luasnip')
require('telescope').load_extension('dap')
