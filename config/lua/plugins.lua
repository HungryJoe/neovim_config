-- Install plugins via Packer
-- Link: https://github.com/wbthomason/packer.nvim

return require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', config=function() require('packer_config')() end}
  use {'neovim/nvim-lspconfig', config=function() require('lspconfig_config')() end}
  use { 'L3MON4D3/LuaSnip' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config=function() require('cmp_config')() end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config=function() require('treesitter_config')() end
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config=function() require('lualine_config')() end
  }
  use {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    requires = 'kyazdani42/nvim-web-devicons',
    config=function() require('bufferline_config')() end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config=function() require('gitsigns_config')() end
  }
  use {'edluffy/specs.nvim', config=function() require('specs_config')() end}
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
    config=function() require('trouble_config') end
  }
  use {'kyazdani42/nvim-web-devicons', config=function() require('web-devicons_config')() end}
  use {'ggandor/leap.nvim', config=function() require('leap_config')() end}
  use {'ggandor/flit.nvim', config=function() require('flit').setup{} end, requires={'ggandor/leap.nvim'}}
  use {'ray-x/lsp_signature.nvim', config=function() require('lsp_signature_config')() end}
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
