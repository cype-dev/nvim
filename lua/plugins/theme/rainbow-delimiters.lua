return {
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      require('rainbow-delimiters.setup').setup({
        highlight = {
          'RainbowDelimiterBlue',
          'RainbowDelimiterCyan',
          'RainbowDelimiterGreen',
          'RainbowDelimiterYellow',
          'RainbowDelimiterOrange',
          'RainbowDelimiterRed',
          'RainbowDelimiterViolet',
        }
      })
    end
  }
}
