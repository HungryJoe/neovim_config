-- Install plugins via Packer
-- Link: https://github.com/wbthomason/packer.nvim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'L3MON4D3/LuaSnip' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  use {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {'edluffy/specs.nvim'}
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
  }
  use 'ggandor/lightspeed.nvim'
  use 'ray-x/lsp_signature.nvim'
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }
  use "HungryJoe/nvim-treesitter-textobjects"
end)
