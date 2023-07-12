-- Install plugins via paq
-- Link: https://github.com/savq/paq.nvim

local PKGS = {
    -- paq can manage itself
    'savq/paq-nvim';
    'neovim/nvim-lspconfig';
    {
      'nvim-treesitter/nvim-treesitter',
      run = function() vim.cmd ':TSUpdate' end,
    };
    'nvim-tree/nvim-web-devicons';
    "nvimdev/lspsaga.nvim";
  }

local function configure_plugins()
  -- vim.opt.runtimepath:append("~/Code/Third_Party_Software/nvim-treesitter-textobjects")
  vim.opt.runtimepath:append("~/.local/share/vim/nginx_conf")

  require('lspconfig_config_minimal')()
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
  require('surround_config')()
  require('sibling_swap_config')()
  require('yanky_config')()
  require('lsp_saga_config')()
  require('toggler_config')()
  require('neogen_config')()
  require('autopairs_config')()
  require('which_key_config')()
  require('dressing_config')()
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
  -- configure_plugins()
  require('lspconfig_config_minimal')()
  require('lsp_saga_config')()
end

return bootstrap_paq
