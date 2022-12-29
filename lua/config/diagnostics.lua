vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
  },
  underline = false,
  update_in_insert = true,
  severity_sort = true,
}

-- Set diagnostic icons
local signs = require('config.theme').diagnostic_signs
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
