-----------
-- Theme --
-----------
-- Set border type
local border = 'single'
local borderchars = {
  prompt  = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
  results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
  preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
}

-- Set signs used for diagnostics
local diagnostic_signs = { Error = '', Warn = '', Hint = '', Info = '' }
local fold_signs = { expanded = '', collapsed = '' }

return {
  border = border,
  borderchars = borderchars,
  diagnostic_signs = diagnostic_signs,
  fold_signs = fold_signs
}
