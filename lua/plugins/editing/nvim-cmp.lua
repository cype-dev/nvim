-- TODO: Replace with builtin completion (long-term)
return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
      { 'petertriho/cmp-git', opts = {} },
      'onsails/lspkind.nvim'
    },
    config = function()
      local cmp = require('cmp')

      -- Editor autocomplete
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          {
            name = 'path',
            options = {
              trailing_slash = true
            }
          },
          { name = 'buffer' }
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>']      = cmp.mapping.confirm({ select = false }),
          ['<C-d>']     = cmp.mapping.scroll_docs(4),
          ['<C-u>']     = cmp.mapping.scroll_docs(-4),
          ['<Tab>']     = cmp.mapping(
          -- Completion -> Snippet Expand + Jump -> Tabout -> <Tab>
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require('luasnip').expand_or_jumpable() then
                require('luasnip').expand_or_jump()
              elseif not vim.fn.getline('.'):sub(0, vim.fn.col('.') - 1):match('^%s*$')
                and require('nvim-treesitter.parsers').has_parser() then
                -- Do not use tabout if there is only whitespace before cursor
                require('tabout').tabout()
              else
                fallback()
              end
            end, { 'i', 's' }),
          ['<S-Tab>']   = cmp.mapping(
          -- Completion -> Snippet Jump -> Tabout
            function()
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require('luasnip').jumpable(-1) then
                require('luasnip').jump(-1)
              elseif require('nvim-treesitter.parsers').has_parser() then
                require('tabout').taboutBack()
              end
            end, { 'i', 's' }),
          ['<C-Space>'] = cmp.mapping(
            function()
              if cmp.visible() then
                cmp.abort()
              else
                cmp.complete()
              end
            end, { 'i', 's' })
        }),
        completion = {
          preselect   = cmp.PreselectMode.None,
          completeopt = 'menu, menuone, noselect'
        },
        window = {
          completion    = vim.tbl_deep_extend('force', cmp.config.window.bordered(), { border = require('style').border }),
          documentation = vim.tbl_deep_extend('force', cmp.config.window.bordered(), { border = require('style').border })
        },
        formatting = {
          format = require('lspkind').cmp_format({
            mode          = 'symbol_text',
            maxwidth      = 50,
            ellipsis_char = '...'
          })
        }
      })

      -- Search autocomplete
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Cmdline autocomplete
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!', 'edit', 'write' },
            }
          }
        })
      })

      -- Git commit autocomplete
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
          { name = 'luasnip' },
          { name = 'buffer' }
        })
      })
    end
  }
}
