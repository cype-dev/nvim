return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- Show blame in current line after short delay
      current_line_blame = true,
      -- Work with bare dotfiles repository
      worktrees = {
        {
          toplevel = vim.env.HOME,
          gitdir = vim.env.HOME .. '/.dotfiles'
        }
      },
      preview_config = {
        border = require('style').border,
      }
    }
  }
}
