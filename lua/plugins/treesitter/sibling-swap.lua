-- Helper  functions for dot-repeatability
local swap_next = function()
  vim.go.operatorfunc = "v:lua.require'sibling-swap'.swap_with_right_with_opp"
  return 'g@l'
end
local swap_prev = function()
  vim.go.operatorfunc = "v:lua.require'sibling-swap'.swap_with_left_with_opp"
  return 'g@l'
end

return {
  {
    'Wansmer/sibling-swap.nvim',
    dependencies = {
      'nvim-treesitter'
    },
    keys = {
      { '<Leader>re', desc = 'Swap element with next' },
      { '<Leader>rE', desc = 'Swap element with prev' },
    },
    config = function()
      require('sibling-swap').setup({
        use_default_keymaps = false,
        highlight_node_at_cursor = true
      })

      vim.keymap.set('n', '<Leader>re', swap_next, { expr = true, desc = 'Swap element with next' })
      vim.keymap.set('n', '<Leader>rE', swap_prev, { expr = true, desc = 'Swap element with prev' })
    end
  }
}
