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
    "nvim-telescope/telescope.nvim";
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'};
    "kylechui/nvim-surround";
    "folke/which-key.nvim";
    -- "Wansmer/sibling-swap.nvim";
    "gbprod/yanky.nvim";
    "glepnir/lspsaga.nvim";
    "nguyenvukhang/nvim-toggler";
    "jiangmiao/auto-pairs";
    "aklt/plantuml-syntax";
    {'gelguy/wilder.nvim',  run = ':UpdateRemotePlugins'};
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
  vim.opt.runtimepath:append("~/.local/share/vim/nginx_conf")
  require("nvim-surround").setup({
    keymaps = {
      insert = false,
      insert_line = false,
      normal = "<leader>ss",
      normal_line = "<leader>sS",
      visual = "<leader>s",
      visual_line = "<leader>S",
      delete = "<leader>sd",
      change = "<leader>sc",
    },
    aliases = {
        ["a"] = ")",
        ["d"] = "}",
        ["f"] = "]",
        ["g"] = "\"",
        ["q"] = { '"', "'", "`" },
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
  })
  require("which-key").setup{
    plugins = {
      spelling = {
        enabled = true;
      }
    }
  }
  vim.opt.runtimepath:append("~/Code/Third_Party_Software/sibling-swap.nvim")
  require('sibling-swap').setup({
    require_siblings_on_same_line = false
  })
  require('yanky').setup({
    highlight = {
      timer = 250
    }
  })
  require('telescope').load_extension('yank_history')
  require'lspsaga'.setup{
    symbol_in_winbar = {
      separator = " ",
      show_file = false,
    },
  }
  require'nvim-toggler'.setup{
    inverses = {
      ['>'] = '<',
      ['True'] = 'False',
    }
  }
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
