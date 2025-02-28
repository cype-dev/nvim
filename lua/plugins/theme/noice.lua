return {
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        opts = {
          background_colour = '#000000', -- Transparent background for notify
          -- Custom border for notifications
          on_open = function(win)
            local config = vim.api.nvim_win_get_config(win)
            config.border = require('style').border
            vim.api.nvim_win_set_config(win, config)
          end
        }
      },
    },
    event = 'VeryLazy',
    config = function()
      require('noice').setup({
        lsp = {
          -- override markdown rendering so that cmp and other plugins use Treesitter
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          }
        },
        presets = {
          lsp_doc_border = true,
          inc_rename = true,
        },
        views = {
          mini = {
            win_options = {
              winblend = 0 -- Remove background from lsp progress
            }
          },
          cmdline_popup = {
            border = {
              style = require('style').border -- Custom border
            }
          },
          hover = {
            border = {
              style = require('style').border -- Custom border
            }
          }
        }
      })
    end
  }
}
