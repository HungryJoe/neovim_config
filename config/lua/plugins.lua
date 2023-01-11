-- Install plugins via Packer
-- Link: https://github.com/wbthomason/packer.nvim

return require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', config=require('packer_config')()}
  use {'neovim/nvim-lspconfig', config=require('lspconfig_config')()}
  use { 'L3MON4D3/LuaSnip' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config=require('cmp_config')()
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config=require('treesitter_config')()
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config=require('lualine_config')()
  }
  use {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    requires = 'kyazdani42/nvim-web-devicons',
    config=require('bufferline_config')()
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config=require('gitsigns_config')()
  }
  use {'edluffy/specs.nvim', config=require('specs_config')()}
  use {
    'nvim-treesitter/playground',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    }
  }
  use 'folke/tokyonight.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config=require('trouble_config')()
  }
  use {'kyazdani42/nvim-web-devicons', config=require('web-devicons_config')()}
  use {'ggandor/leap.nvim', config=require('leap_config')()}
  use {'ggandor/flit.nvim', config=require('flit').setup{}, requires={'ggandor/leap.nvim'}}
  use {'ray-x/lsp_signature.nvim', config=require('lsp_signature_config')()}
  -- use {"~/Code/Third_Party_Software/nvim-treesitter-textobjects", branch="add-operand"}
  use {"HungryJoe/nvim-treesitter-textobjects"}
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    requires = {"nvim-telescope/telescope.nvim"}
  }
end)
