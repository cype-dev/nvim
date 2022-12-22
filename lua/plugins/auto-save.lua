local exclude = {}
require('auto-save').setup {
  condition = function(buf) -- Allow autosave when...
    local utils = require 'auto-save.utils.data'
    if vim.fn.getbufvar(buf, '&modifiable') == 1 -- ...it's modifiable
        and utils.not_in(vim.fn.getbufvar(buf, '&filetype'), exclude) -- ...not excluded
        and vim.fn.filereadable(vim.fn.expand '%') == 1 -- ...not an unwritten file
    then
      return true
    end
    return false
  end,
}
