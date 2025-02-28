return {
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
    keys = {
      { '<Leader>dt', '<CMD>TodoTrouble<CR>', desc = 'Toggle TODOs' },
    },
    opts = {}
  }
}
