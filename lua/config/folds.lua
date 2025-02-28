local folds = vim.api.nvim_create_augroup('folds', { clear = true })

-- Enable folding, but do not fold anything by default
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Use Treesitter for folding (Replaced by nvim-ufo for now)
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- Only save folds and cursor position in view file
vim.opt.viewoptions = { 'folds', 'cursor' }
-- Save and restore views automatically
vim.api.nvim_create_autocmd('BufWinLeave', {
  group = folds,
  pattern = '?*',
  desc = 'Save view',
  command = 'mkview',
})
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = folds,
  pattern = '?*',
  desc = 'Restore view',
  command = 'silent! loadview'
})
