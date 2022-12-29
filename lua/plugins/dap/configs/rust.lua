local config = require('mason-nvim-dap.mappings.configurations').codelldb
config[1].program = function()
  vim.fn.system('cargo build')
  local file = vim.fn.getcwd() .. '/target/debug/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  if (vim.fn.filereadable(file) == 1) then
    return file
  else
    return vim.fn.input('Path to executable: ', file, 'file')
  end
end
return config
