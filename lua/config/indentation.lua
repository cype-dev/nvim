local indentation = vim.api.nvim_create_augroup('indentation', { clear = true })

vim.o.expandtab   = true -- Insert spaces when pressing <Tab>
vim.o.shiftwidth  = 4    -- Number of spaces to indent
vim.o.softtabstop = -1   -- Use 'shiftwidth'-many spaces for <Tab> and <BS>
vim.o.shiftround  = true -- Indent to nearest multiple of 'shiftwidth'

-- Do not insert comment when creating newline next to commented line.
-- Needs to be called in autocmd, because it's overwritten in a lot of ftplugins
vim.api.nvim_create_autocmd('FileType', {
  group = indentation,
  desc = 'Disables copying of comments when creating new lines',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end
})
