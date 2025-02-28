vim.g.mapleader = ' '        -- Set leader key
vim.o.undofile = true        -- Persistent undo
vim.o.timeoutlen = 300       -- Milliseconds to wait for key sequences
vim.opt.termguicolors = true -- Enable true colors

-- Load plugins
require('plugins')

-- Load split config
require('config')
