return {
  {
    'echasnovski/mini.files',
    event = 'VimEnter',
    keys = {
      {
        '<Leader>e',
        function() require('mini.files').open(vim.api.nvim_buf_get_name(0), false) end,
        desc = 'Open mini.files explorer'
      }
    },
    opts = {},
  }
}
