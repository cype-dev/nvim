return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      require('lualine').setup({
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' }
        },
        sections = {
          lualine_a = {
            'mode',
            -- Macro recording
            function()
              local recording_register = vim.fn.reg_recording()
              if recording_register == '' then
                return ''
              else
                return '󰑊Rec @' .. recording_register
              end
            end
          }
        }
      })
    end
  }
}
