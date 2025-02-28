-- Load friendly-snippets
return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      -- Enable lorem ipsum snippets globally
      require('luasnip').filetype_extend('all', { 'loremipsum' })
    end
  }
}
