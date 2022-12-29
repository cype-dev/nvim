return {
  setup = function(bufnr)
    vim.keymap.set('n', '<Leader>lc', vim.lsp.buf.code_action, { silent = true, desc = 'Open code actions',          buffer = bufnr })
    vim.keymap.set('n', '<Leader>lh', vim.lsp.buf.hover,       { silent = true, desc = 'Open hover information',     buffer = bufnr })
    vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.format,      { silent = true, desc = 'Format document',            buffer = bufnr })
    vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename,      { silent = true, desc = 'Rename object under cursor', buffer = bufnr })
  end
}
