return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      wk.setup({
        win = {
          border = require('style').border
        }
      })

      wk.add({
        { '<Leader>d', group = 'Diagnostics' },
        { '<Leader>f', group = 'Search' },
        { '<Leader>o', group = 'Outline' },
        { '<Leader>r', group = 'Refactor' },
        { '<Leader>v', group = 'View' },
        { '<Leader>c', group = 'ChatGPT', mode = { "n", "v" } },
      })
    end
  }
}
