return {
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
      { '<Leader>rs', function() require('treesj').split() end, desc = 'Split code block' },
      { '<Leader>rj', function() require('treesj').join() end, desc = 'Join code block' }
    },
    opts = {
      use_default_keymaps = false
    }
  }
}
