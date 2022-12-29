-- Bootstrap packer if not installed
local ensure_packer = function()
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
end
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' } -- Let packer manage itself

  -----------
  -- Theme --
  -----------
  use { 'ellisonleao/gruvbox.nvim', config = function() require 'plugins.gruvbox' end }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require 'plugins.lualine' end,
  }
  -- use { 'akinsho/bufferline.nvim', config = function() require 'plugins.bufferline' end }
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require 'plugins.indent-blankline' end }
  -- use { 'lukas-reineke/virt-column.nvim', config = function() require('virt-column').setup() end }

  --------------
  -- Features --
  --------------
  use { 'lambdalisue/suda.vim' }
  -- use { 'Pocco81/auto-save.nvim', config = function() require 'plugins.auto-save' end }
  use { 'karb94/neoscroll.nvim', config = function() require('neoscroll').setup() end }
  use { 'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end }

  -------------
  -- Editing --
  -------------
  use {
    'numToStr/Comment.nvim',
    config = function() require 'plugins.comment' end,
  }
  use { 'echasnovski/mini.align', config = function() require('mini.align').setup() end }
  use { 'kylechui/nvim-surround', config = function() require('nvim-surround').setup {} end }
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end }
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      'rafamadriz/friendly-snippets',
      'benfowler/telescope-luasnip.nvim',
    },
    config = function() require 'plugins.luasnip' end,
  }

  -----------
  -- Menus --
  -----------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function() require 'plugins.telescope' end,
  }
  use { 'mrjones2014/legendary.nvim' }
  use { 'folke/trouble.nvim', config = function() require('plugins.trouble') end }

  ----------------
  -- Completion --
  ----------------
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function() require 'plugins.nvim-cmp' end,
  }

  ----------------
  -- Treesitter --
  ----------------
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-context',
      -- 'p00f/nvim-ts-rainbow',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },
    run = ':TSUpdate',
    config = function() require 'plugins.treesitter' end,
  }

  ---------
  -- LSP --
  ---------
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- mason
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- null-ls
      'jose-elias-alvarez/null-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
      -- features
      'j-hui/fidget.nvim',
      'lvimuser/lsp-inlayhints.nvim',
      'kosayoda/nvim-lightbulb',
    },
    config = function() require 'plugins.lsp' end,
  }
  use { 'folke/neodev.nvim' }
  use { 'simrat39/rust-tools.nvim' }

  ---------
  -- DAP --
  ---------
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'jay-babu/mason-nvim-dap.nvim',
      'nvim-telescope/telescope-dap.nvim',
    },
    config = function() require 'plugins.dap' end,
  }

  ---------
  -- Fun --
  ---------
  use { 'eandrju/cellular-automaton.nvim' }
  use { 'nvim-telescope/telescope-symbols.nvim' }

  -- Automatically setup packer after initial install
  if packer_bootstrap then
    require('packer').sync()
  end

  ---------
  -- Zen --
  ---------
  use { 'folke/zen-mode.nvim', config = function() require 'plugins.zen-mode' end }
  use { 'folke/twilight.nvim', config = function() require('twilight').setup() end }

  ------------------
  -- Colorschemes --
  ------------------
  use { 'sainnhe/gruvbox-material' }
  use { 'rebelot/kanagawa.nvim', config = function() require('kanagawa').setup() end }
end)
