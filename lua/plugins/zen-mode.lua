local center_ac
local colorscheme
require('zen-mode').setup {
  window = {
    backdrop = 1,  -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width    = .5, -- width of the Zen window (percentage)
    height   = 1,  -- height of the Zen window (percentage)
    options = { -- vim.wo options
      signcolumn     = 'no',  -- disable signcolumn
      number         = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      cursorline     = false, -- disable cursorline
      foldcolumn     = '0',   -- disable fold column
      colorcolumn    = ''     -- disable color column(s)
    },
  },
  plugins = {
    options = {
      ruler   = false, -- disable the ruler text in the cmd line area
      showcmd = false, -- disable the command in the last line of the screen
    },
    twilight = { enabled = true },  -- enable twilight on entering
    gitsigns = { enabled = false }, -- disable gitsigns on entering
  },
  on_open = function() -- On entering zen-mode
    -- Set colorscheme
    colorscheme = vim.g.colors_name
    vim.cmd.colorscheme 'gruvbox-material'
    -- Remove background
    vim.api.nvim_set_hl(0, 'ZenBg', { ctermbg = 0 })
    -- Keep cursor vertically centered
    center_ac = vim.api.nvim_create_autocmd('CursorMoved,CursorMovedI', { buffer = 0,  command = 'normal! zz' })
  end,
  on_close = function() -- On exiting zen-mode
    -- Reset colorscheme
    vim.cmd('colorscheme ' .. colorscheme)
    -- Remove autocommand to keep cursor centered
    vim.api.nvim_del_autocmd(center_ac)
  end,
}
