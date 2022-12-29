-- Show lightbulb if codeaction is available
require('nvim-lightbulb').setup {
  autocmd = {
    enabled = true,
  },
  sign = {
    priority = 13
  },
}
vim.fn.sign_define('LightBulbSign', { text = '💡', texthl = 'LightBulbSign', linehl='', numhl='' })
