-- Set used telescope theme based on operation
require('telescope').setup {
  defaults = {
    prompt_prefix = ' ',
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
  }
}
local themes = require 'telescope.themes'
require('dressing').setup {
  select = {
    get_config = function(opts)
      if opts.kind == 'codeaction' then
        return {
          telescope = themes.get_cursor(),
        }
      elseif opts.kind == 'luasnip' then
        return {
          telescope = themes.get_cursor(),
        }
      end
    end,
  },
}
