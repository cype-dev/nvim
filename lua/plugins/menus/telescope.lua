return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = { 'Telescope' },
    keys = {
      { '<Leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find files' },
      { '<Leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Live Grep' },
      { '<Leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Buffers' },
      { '<Leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Help Tags' }
    },
    opts = {
      defaults = {
        borderchars = require('style').borderchars,
        mappings = {
          i = {
            ['<Esc>'] = require('telescope.actions').close,
            ['<C-t>'] = function(opts) require('trouble.providers.telescope').open_with_trouble(opts) end,
            ['<Tab>'] = require('telescope.actions').move_selection_next,
            ['<S-Tab>'] = require('telescope.actions').move_selection_previous
          }
        }
      }
    }
  }
}
