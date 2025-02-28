return {
  {
    'kylechui/nvim-surround',
    keys = {
      { 'ys',     mode = 'n', desc = 'Add a surrounding pair around a motion (normal mode)' },
      { 'yS',     mode = 'n', desc = 'Add a surrounding pair around a motion, on new lines (normal mode)' },
      { 'ds',     mode = 'n', desc = 'Delete a surrounding pair' },
      { 'cs',     mode = 'n', desc = 'Change a surrounding pair' },
      { 'cS',     mode = 'n', desc = 'Change a surrounding pair, putting replacements on new lines' },
      { 'S',      mode = 'v', desc = 'Add a surrounding pair around a visual selection' },
      { '<C-g>S', mode = 'i', desc = 'Add a surrounding pair around the cursor, on new lines (insert mode)' },
      { '<C-g>s', mode = 'i', desc = 'Add a surrounding pair around the cursor (insert mode)' },
    },
    opts = {}
  }
}
