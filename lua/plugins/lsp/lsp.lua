-- Disable lsp-zero overriding noice
vim.g.lsp_zero_ui_float_border = 0

return {
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = require('style').border -- Custom border
      }
    }
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'VonHeikemen/lsp-zero.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'nvimtools/none-ls.nvim',
      { 'folke/neodev.nvim',       opts = {} },
      { 'smjonas/inc-rename.nvim', opts = {} },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      -- Configure hotkeys
      lsp_zero.on_attach(
        function(client, bufnr)
          local wk = require('which-key')
          wk.add({
            { '<Leader>l', buffer = bufnr, group = 'LSP' },
            { '<Leader>ld', buffer = bufnr, function() vim.lsp.buf.definition() end, desc = 'Goto definition' },
            { '<Leader>le', buffer = bufnr, function() vim.lsp.buf.declaration() end, desc = 'Goto declaration' },
            { '<Leader>li', buffer = bufnr, function() require('telescope.builtin').lsp_implementations() end, desc = 'Show implementation(s)' },
            { '<Leader>lt', buffer = bufnr, function() vim.lsp.buf.type_definition() end, desc = 'Goto type definition' },
            { '<Leader>lr', buffer = bufnr, function() require('telescope.builtin').lsp_references() end, desc = 'Show references' },
            { '<Leader>ls', buffer = bufnr, function() vim.lsp.buf.signature_help() end, desc = 'Signature help' },
            { '<Leader>lC', buffer = bufnr, function() vim.lsp.buf.code_action() end, desc = 'Show code actions' },
            { '<Leader>lR', buffer = bufnr, function() return ':IncRename ' .. vim.fn.expand('<cword>') end, desc = 'Rename', expr = true },
            { '<Leader>lF', buffer = bufnr, function() vim.lsp.buf.format({ async = true }) end, desc = 'Format file' },
          });
          -- Enable inlay hints if supported
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        end)

      local style = require('style');
      -- Theme
      lsp_zero.set_sign_icons({
        error = style.signs.error,
        warn = style.signs.warning,
        hint = style.signs.hint,
        info = style.signs.information
      })

      -- Configure servers
      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = require('lspconfig').lua_ls.setup({}),
          ts_ls = require('lspconfig').ts_ls.setup({
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                }
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                }
              }
            }
          })
        },
      })

      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            extra_filetypes = { 'xml' }
          }),
          null_ls.builtins.formatting.shfmt
        }
      })
    end
  }
}
