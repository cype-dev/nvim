-- Vimrc local augroup
local augroup = vim.api.nvim_create_augroup('vimrc', { clear = true })

-----------------
-- Indentation --
-----------------
vim.opt.tabstop        = 8         -- Number of spaces to display tab character as
vim.opt.softtabstop    = 4         -- Number of spaces to insert/delete
vim.opt.shiftwidth     = 4         -- Number of spaces used for indentation
vim.opt.expandtab      = true      -- Replace tabs with spaces
vim.opt.shiftround     = true      -- Shift indentation to nearest multiple of shiftwidth
vim.opt.breakindent    = true      -- Indent wrapped lines to same level
vim.opt.breakindentopt = 'shift:2' -- Add additional 2 columns to wrapped lines
-- vim.opt.linebreak      = true      -- Break wrapped lines at sensible characters

----------------
-- Formatting --
----------------
-- -- Disable continuation of comments on newline
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vimrc,
--   pattern = '*',
--   callback = function() vim.opt_local.formatoptions:remove { 'c', 'r', 'o' } end,
-- })

----------------
-- Whitespace --
----------------
-- Display trailing whitespace
vim.opt.list      = true
vim.opt.listchars = { trail = '·', tab = '█▒' }
-- -- Show trailing whitespace as error
-- vim.fn.matchadd('ErrorMsg', [[\s\+$]])

------------
-- Status --
------------
-- Hide mode in (default) status line
vim.opt.showmode       = false
-- Show signcolumn
vim.opt.signcolumn     = 'yes'
-- Highlight line cursor is on
vim.opt.cursorline     = true
-- Use relative numbers except for cursor line
vim.opt.number         = true
vim.opt.relativenumber = true

-- Change bg color at column 81
vim.opt.colorcolumn    = '81'
-- -- Change bg color beyond column 120
-- for i = 121,999 do vim.opt.colorcolumn:append (tostring(i)) end

-------------
-- Folding --
-------------
-- Start unfolded
vim.opt.foldlevelstart = 99
-- Save only folds and cursor position
vim.opt.viewoptions    = 'folds,cursor'
-- Save/Load view
vim.api.nvim_create_autocmd('BufWinEnter', { group = augroup, pattern = '*', command = 'silent! loadview' })
vim.api.nvim_create_autocmd('BufWrite', { group = augroup, pattern = '*', command = 'mkview' })

----------
-- Undo --
----------
-- Enable persistent undo
vim.opt.undofile = true

--------------
-- Keybinds --
--------------
-- -- Buffer movement
-- vim.keymap.set('n', '<S-h>', vim.cmd.bp, { silent = true })
-- vim.keymap.set('n', '<S-l>', vim.cmd.bn, { silent = true })
vim.keymap.set('n', '<ESC>', vim.cmd.noh, { silent = true, desc = 'Hide search results when pressing ESC' })
vim.keymap.set(
  'i',
  '<S-CR>',
  '<CR><C-U>',
  { silent = true, desc = 'Insert empty newline (no comment)' }
)
vim.g.mapleader = ' '


---------------
-- Behaviour --
---------------
-- Keep lines between cursor and bottom while scrolling
vim.opt.scrolloff     = 5
vim.opt.updatetime    = 1
vim.opt.termguicolors = true

-------------
-- Folding --
-------------
-- Width of foldcolumn
vim.opt.foldcolumn = '1'
-- Text to display on folds
vim.opt.foldtext = "getline(v:foldstart).'...'.trim(getline(v:foldend))"
-- Characters used for folds
local signs = require('config.theme').fold_signs
vim.opt.fillchars:append { fold = ' ', foldopen = signs.expanded, foldclose = signs.collapsed, foldsep = '│' }

-----------
-- Mouse --
-----------
-- -- Send mouse movement events
-- vim.opt.mousemoveevent = true

-------------
-- Plugins --
-------------
-- Load packer
require 'plugins'
-- Recompile plugin config after changes
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = vim.fn.expand('<sfile>:h') .. '/lua/plugins/*.lua', -- Since 'require' is in main init.vim, <sfile> expands to that file
  command = 'PackerCompile'
})

------------------
-- Split config --
------------------
-- Load config
require 'config'
