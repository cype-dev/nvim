local rt = require("rust-tools")
return {
  setup = function(capabilities, on_attach)
    rt.setup {
      tools = {
        inlay_hints = {
          auto = false,
        },
        hover_actions = {
          border = require('config.theme').border,
        },
      },
      server = {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- vim.keymap.set('n', '<Leader>lc', rt.code_action_group.code_action_group, { silent = true, desc = 'Open code actions',      buffer = bufnr })
          vim.keymap.set('n', '<Leader>lh', rt.hover_actions.hover_actions,         { silent = true, desc = 'Open hover information', buffer = bufnr })
        end,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = 'clippy'
            }
          },
        },
      },
    }
  end,
}
