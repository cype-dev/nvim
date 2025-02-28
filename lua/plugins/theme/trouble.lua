return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'Trouble' },
    keys = {
          { '<Leader>dw', function() require('trouble').toggle('workspace_diagnostics') end, desc = 'Toggle workspace diagnostics' },
          { '<Leader>dd', function() require('trouble').toggle('document_diagnostics') end,  desc = 'Toggle document diagnostics' },
    },
    opts = {
      auto_close = true,
      signs = require('style').signs,
      fold_open = require('style').folds.foldopen,
      fold_closed = require('style').folds.foldclose,
    }
  }
}
