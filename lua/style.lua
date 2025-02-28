-- Signs used for diagnostics (trouble.nvim, sign column)
local signs = {
  error       = '',
  warning     = '',
  hint        = '',
  information = '',
  other       = ''
}

local folds = {
  foldopen  = '',
  foldclose = '',
}

-- Border used for floating windows
local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } -- Rounded
-- local border = { '╔', '═', '╗', '║', '╝', '═', '╚', '║' } -- Double

-- Telescope needs specific configuration
local borderchars = {
  border[2],
  border[4],
  border[6],
  border[8],
  border[1],
  border[3],
  border[5],
  border[7]
}

return {
  signs = signs,
  border = border,
  folds = folds,
  borderchars = borderchars
}
