-- TODO: configure
-- TODO: which-key group
return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { [[<C-\>]], desc = 'Toggle terminal' }
    },
    cmd = {
      'ToggleTermSendCurrentLine', 'ToggleTermSendVisualSelection'
    },
    opts = {
      open_mapping = [[<C-\>]],
    }
  }
}
