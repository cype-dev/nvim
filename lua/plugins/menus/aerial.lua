return {
  'stevearc/aerial.nvim',
  keys = {
    { '<leader>oo', function() require('aerial').toggle() end,     desc = 'Toggle aerial outline' },
    { '<leader>on', function() require('aerial').nav_toggle() end, desc = 'Toggle aerial nav' }
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    layout = {
      default_direction = 'left',
      max_width = 40,
      min_width = 20,
    },
    filter_kind = false,
    nav = {
      border = require('style').border
    }
  }
}
