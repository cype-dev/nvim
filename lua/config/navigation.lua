-- Move in screenlines (ignore softwrap), except when jumping with number
vim.keymap.set('n', 'j', "(v:count == 0 ? 'gj' : 'j')", { expr = true })
vim.keymap.set('n', 'k', "(v:count == 0 ? 'gk' : 'k')", { expr = true })

-- Move between buffers
vim.keymap.set('n', '[b', ":bp<CR>", { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', ":bn<CR>", { desc = 'Next buffer' })

-- Use select mode when selecting with mouse
vim.opt.selectmode = 'mouse'

-- Toggle display of whitespace characters (listchars)
vim.keymap.set('n', '<Leader>vl', function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = 'Toggle whitespace character display' })
