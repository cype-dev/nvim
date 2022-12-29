local augroup = vim.api.nvim_create_augroup('mason-config', { clear = true })

----------------------
-- Language Servers --
----------------------
require('mason').setup{
  ui = {
    border = require('config.theme').border
  }
}
require('mason-lspconfig').setup()
require('lsp-inlayhints').setup()

-- Combine default capabilities with nvim-cmp capabilities
local capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  require('cmp_nvim_lsp').default_capabilities()
)

local on_attach = function(client, bufnr)
  require('lsp-inlayhints').on_attach(client, bufnr, false)
  -- vim.api.nvim_create_autocmd(
  --   'BufWritePre',
  --   { group = augroup, pattern = '*', callback = function() vim.lsp.buf.format { timeout_ms = 1000 } end }
  -- )
  require('plugins.lsp.keymaps').setup(bufnr)
end

require('mason-lspconfig').setup_handlers {
  -- Default handler
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,
  -- Server specific handlers
  ['sumneko_lua'] = function() require('plugins.lsp.servers.lua').setup(capabilities, on_attach) end,
  ['rust_analyzer'] = function() require('plugins.lsp.servers.rust').setup(capabilities, on_attach) end,
}

-------------
-- null-ls --
-------------
require('mason-null-ls').setup {
  automatic_setup = true,
}
require('mason-null-ls').setup_handlers {}
