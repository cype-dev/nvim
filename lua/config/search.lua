vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase  = true -- Case-sensitive search if uppercase letters are used
-- Hide search highlights when pressing <ESC>
vim.keymap.set('n', '<ESC>', ':noh<CR><ESC>', { silent = true })
