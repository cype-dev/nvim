local dap   = require('dap')
local dapui = require('dapui')
local signs = require('config.theme').fold_signs

dapui.setup {
  icons = { expanded = signs.expanded, collapsed = signs.collapsed, current_frame = '→' },
  element_mappings = {
    stacks = {
      open   = '<CR>',
      expand = 'o',
    }
  }
}

-- Sign icons/colors
vim.fn.sign_define('DapBreakpoint',          { text='', texthl='DapBreakpoint',  linehl='',               numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpoint',  linehl='',               numhl='' })
vim.fn.sign_define('DapBreakpointRejected',  { text='', texthl='DapBreakpoint',  linehl='',               numhl='' })
vim.fn.sign_define('DapStopped',             { text='→', texthl='DapStoppedText', linehl='DapStoppedLine', numhl='' })

-- Toggle dap-ui automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open{}
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close{}
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close{}
end
