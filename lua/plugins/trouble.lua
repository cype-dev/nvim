require('trouble').setup {
  auto_preview = false,
  use_diagnostic_signs = true,
}

vim.keymap.set('n', '<Leader>tn', function() require("trouble").next({skip_groups = true, jump = true}) end    , { silent = true, desc = 'Open code actions' })
vim.keymap.set('n', '<Leader>tp', function() require("trouble").previous({skip_groups = true, jump = true}) end, { silent = true, desc = 'Open code actions' })
