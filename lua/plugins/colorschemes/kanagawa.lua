return {
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- Remove background from floating window borders
            NormalFloat                   = { bg = 'none' },
            FloatBorder                   = { bg = 'none' },
            FloatTitle                    = { bg = 'none' },

            -- Remove background from noice window borders
            NoiceCmdlinePopupBorder       = { fg = theme.diag.info },
            NoiceCmdlinePopupTitle        = { fg = theme.diag.info },
            NoiceCmdlineIcon              = { fg = theme.diag.info },
            NoiceCmdlinePopupBorderSearch = { fg = theme.diag.warning },
            NoiceCmdlineIconSearch        = { fg = theme.diag.warning },
            NoiceConfirmBorder            = { fg = theme.diag.info },
          }
        end
      })
      -- vim.cmd.colorscheme('kanagawa')
    end
  }
}
