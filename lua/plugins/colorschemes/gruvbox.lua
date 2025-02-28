return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local gruvbox = require('gruvbox')
      local theme = gruvbox.palette
      gruvbox.setup({
        contrast = 'soft',
        inverse = false,
        overrides = {
          -- Remove background from floating window borders
          NormalFloat                   = { bg = 'none' },
          FloatBorder                   = { fg = theme.dark2, bg = 'none' },
          FloatTitle                    = { bg = 'none' },

          -- Remove background from noice window borders
          NoiceCmdlinePopupBorder       = { fg = theme.bright_blue },
          NoiceCmdlinePopupTitle        = { fg = theme.bright_blue },
          NoiceCmdlineIcon              = { fg = theme.bright_blue },
          NoiceCmdlinePopupBorderSearch = { fg = theme.bright_yellow },
          NoiceCmdlineIconSearch        = { fg = theme.bright_yellow },
          NoiceConfirmBorder            = { fg = theme.bright_blue },

          -- Telescope border
          TelescopeBorder               = { link = 'FloatBorder' },
          TelescopePromptBorder         = { link = 'FloatBorder' },
          TelescopeResultsBorder        = { link = 'FloatBorder' },
          TelescopePreviewBorder        = { link = 'FloatBorder' },

          -- Rainbow highlights
          RainbowDelimiterRed           = { link = 'GruvboxRed' },
          RainbowDelimiterYellow        = { link = 'GruvboxYellow' },
          RainbowDelimiterBlue          = { link = 'GruvboxBlue' },
          RainbowDelimiterOrange        = { link = 'GruvboxOrange' },
          RainbowDelimiterGreen         = { link = 'GruvboxGreen' },
          RainbowDelimiterViolet        = { link = 'GruvboxPurple' },
          RainbowDelimiterCyan          = { link = 'GruvboxAqua' }
        }
      })
      vim.cmd.colorscheme('gruvbox')
    end
  }
}
