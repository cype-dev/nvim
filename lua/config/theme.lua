local theme         = vim.api.nvim_create_augroup('theme', { clear = true })
local style         = require('style')

vim.opt.cursorline  = true     -- Highlight current row
vim.opt.colorcolumn = { 81 }   -- Highlight column 81
vim.opt.cmdheight   = 0        -- Hide cmdline (replaced by noice.nvim)
vim.opt.foldcolumn  = '1'      -- Width of foldcolumn
vim.opt.signcolumn  = 'number' -- Combine sign and number column (prefers signs)

-- Characters used for folds
vim.opt.fillchars   = {
  foldopen  = style.folds.foldopen,
  foldsep   = ' ',
  foldclose = style.folds.foldclose,
}

-- Characters representing whitespace
vim.opt.listchars = {
  tab = '├─▶',
  eol = '↲',
  nbsp = '␣',
  trail = '•',
  extends = '»',
  precedes = '«'
}

-- Show relative numbers only when in non-insert mode of focused window
vim.opt.number      = true
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  group    = theme,
  desc     = 'Activates relative numbers in non-insert mode of focused window',
  callback = function()
    if vim.o.number and vim.api.nvim_get_mode().mode ~= 'i' then
      vim.opt.relativenumber = true
    end
  end
})
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  group    = theme,
  desc     = 'Disables relative numbers in insert mode or if unfocused',
  callback = function()
    if vim.o.number then
      vim.opt.relativenumber = false
    end
  end
})

-- Set terminal colors (Gruvbox dark, soft (base16))
vim.g.terminal_color_0  = '32302f'
vim.g.terminal_color_1  = '3c3836'
vim.g.terminal_color_2  = '504945'
vim.g.terminal_color_3  = '665c54'
vim.g.terminal_color_4  = 'bdae93'
vim.g.terminal_color_5  = 'd5c4a1'
vim.g.terminal_color_6  = 'ebdbb2'
vim.g.terminal_color_7  = 'fbf1c7'
vim.g.terminal_color_8  = 'fb4934'
vim.g.terminal_color_9  = 'fe8019'
vim.g.terminal_color_10 = 'fabd2f'
vim.g.terminal_color_11 = 'b8bb26'
vim.g.terminal_color_12 = '8ec07c'
vim.g.terminal_color_13 = '83a598'
vim.g.terminal_color_14 = 'd3869b'
vim.g.terminal_color_15 = 'd65d0e'
