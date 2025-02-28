return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local highlight = {
        'RainbowDelimiterBlue',
        'RainbowDelimiterCyan',
        'RainbowDelimiterGreen',
        'RainbowDelimiterYellow',
        'RainbowDelimiterOrange',
        'RainbowDelimiterRed',
        'RainbowDelimiterViolet'
      }

      require('ibl').setup({
        indent = {
          char = '┆'
        },
        scope = {
          highlight = highlight
        }
      })
      -- Do not show indent line on first column
      local hooks = require('ibl.hooks')
      hooks.register(hooks.type.WHITESPACE,      hooks.builtin.hide_first_space_indent_level)
      hooks.register(hooks.type.WHITESPACE,      hooks.builtin.hide_first_tab_indent_level)
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
  }
}
