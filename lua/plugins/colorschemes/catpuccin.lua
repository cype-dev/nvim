return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    config = function()
      require('catppuccin').setup({})
      -- vim.cmd.colorscheme('catppuccin')
    end
  }
}
