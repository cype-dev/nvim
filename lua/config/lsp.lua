-----------
-- Theme --
-----------
-- Set border type
local border = 'single'

-- Set signs used for diagnostics
local signs = { Error = '', Warn = '', Hint = '', Info = '' }

vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
  },
  underline = false,
  update_in_insert = true,
  severity_sort = true,
}

-- {{{ Helper functions
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- }}}

-- vim: fdm=marker
