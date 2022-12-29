local dap   = require('dap')
require('mason-nvim-dap').setup {
  automatic_setup = true
}
require 'mason-nvim-dap'.setup_handlers {
  -- Default handler
  function(source_name)
    -- Keep original functionality of `automatic_setup = true`
    require('mason-nvim-dap.automatic_setup')(source_name)
    print(vim.inspect(dap.configurations.rust))
  end,
  codelldb = function()
    dap.adapters.codelldb = require('mason-nvim-dap.mappings.adapters').codelldb

    -- Try to find debug executable before prompting user
   dap.configurations.rust = require('plugins.dap.configs.rust')
  end
}
