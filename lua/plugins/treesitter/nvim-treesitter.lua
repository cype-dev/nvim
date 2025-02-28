return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        auto_install = true,
        highlight = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            node_incremental = 'v',
            node_decremental = 'V'
          }
        },
        playground = {
          enable = true
        },
        textobjects = {
          swap = {
            enable = false,
            swap_next = {
              ['saa'] = '@parameter.outer',
              ['sia'] = '@parameter.inner'
            },
            swap_previous = {
              ['Saa'] = '@parameter.outer',
              ['Sia'] = '@parameter.inner'
            }
          }
        }
      })
    end
  }
}
