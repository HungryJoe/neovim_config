-- Install plugins via paq
-- Link: https://github.com/savq/paq.nvim

local PKGS = {
    -- paq can manage itself
    'savq/paq-nvim';
    'neovim/nvim-lspconfig';
    'L3MON4D3/LuaSnip';
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    {
      'nvim-treesitter/nvim-treesitter',
      run = function() vim.cmd ':TSUpdate' end,
    };
    'kyazdani42/nvim-web-devicons';
    'hoob3rt/lualine.nvim';
    {
      'akinsho/nvim-bufferline.lua',
      branch = 'main',
    };
    'nvim-lua/plenary.nvim';
    'lewis6991/gitsigns.nvim';
    'edluffy/specs.nvim';
    'nvim-treesitter/playground';
    'folke/tokyonight.nvim';
    "folke/trouble.nvim";
    'ray-x/lsp_signature.nvim';
    "HungryJoe/nvim-treesitter-textobjects";
    'ggandor/lightspeed.nvim';
    "nvim-telescope/telescope.nvim",
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'};
  }

local function configure_plugins()
  require('lspconfig_config')()
  require('cmp_config')()
  require('treesitter_config')()
  require('lualine_config')()
  require('bufferline_config')()
  require('gitsigns_config')()
  require('specs_config')()
  require('trouble_config')()
  require('web-devicons_config')()
  require('lsp_signature_config')()
  require('lightspeed_config')()
  -- vim.opt.runtimepath:append("~/Code/Third_Party_Software/nvim-treesitter-textobjects")
end

local function clone_paq()
  local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      'https://github.com/savq/paq-nvim.git',
      path
    }
  end
end

local function bootstrap_paq()
  clone_paq()

  -- Load Paq
  vim.cmd('packadd paq-nvim')
  local paq = require('paq')

  -- Read and install packages
  paq(PKGS)
  paq.install()  -- Only tries to install new packages
  configure_plugins()
end

return bootstrap_paq
