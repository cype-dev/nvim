return {
  setup = function(capabilities, on_attach)
    require('neodev').setup()
    require('lspconfig').sumneko_lua.setup {
      capabilities = capabilities or vim.lsp.protocol.make_client_capabilities(),
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace'
          },
          workspace = {
            -- Disable luassert message
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
      on_attach = on_attach or {}
    }
  end,
}
