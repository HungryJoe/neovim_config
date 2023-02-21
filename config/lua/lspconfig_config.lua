-- Configure lspconfig plugin
-- Link: https://github.com/neovim/nvim-lspconfig

return function()
  local lsp = require('lspconfig');

  -- Python LS
  lsp.pyright.setup{
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(fname)
        local root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'pyrightconfig.json',
        }
        return lsp.util.root_pattern(unpack(root_files))(fname) or lsp.util.find_git_ancestor(fname) or lsp.util.path.dirname(fname)
    end,
    settings = {
      python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
      }
      }
    },
    -- cmp setup
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Typescript LS
  lsp.tsserver.setup{
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    -- cmp setup
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Bash/sh/fish LS
  lsp.bashls.setup{
    cmd = { "bash-language-server", "start" },
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.fish)"
    },
    filetypes = {"sh"},
    -- cmp setup
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Docker LS
  lsp.dockerls.setup{
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "Dockerfile", "dockerfile" },
    root_dir = lsp.util.root_pattern("Dockerfile.*"),
    -- cmp setup
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Angular LS
  -- Only works for TTAT frontend
  local project_library_path = "/Users/skagan/Code/ttat/ttat/frontend"
  local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}
  lsp.angularls.setup{
    cmd = cmd,
    on_new_config = function(new_config,new_root_dir)
      new_config.cmd = cmd
    end,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    root_dir = lsp.util.root_pattern("angular.json", ".git"),
    -- cmp setup
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Haskell LS
  lsp.hls.setup{
    cmd = { "haskell-language-server-wrapper", "--lsp", "--logfile=/Users/skagan/.cache/nvim/lsp.log"},
    filetypes = { "haskell", "lhaskell" },
    lspinfo = function(cfg)
      local extra = {}
      local function on_stdout(_, data, _)
        local version = data[1]
        table.insert(extra, 'version:   ' .. version)
      end
      local opts = {
        cwd = cfg.cwd,
        stdout_buffered = true,
        on_stdout = on_stdout,
      }
      local chanid = vim.fn.jobstart({ cfg.cmd[1], '--version' }, opts)
      vim.fn.jobwait { chanid }
      return extra
    end,
    root_dir = lsp.util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml"),
    settings = {
      haskell = {
        formattingProvider = "ormolu"
      }
    },
    -- cmp setup
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Go LS
  require'lspconfig'.gopls.setup{
    cmd = {"/Users/skagan/go/bin/gopls", "serve"},
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Lua LS
  require'lspconfig'.lua_ls.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Elixir LS
  require'lspconfig'.elixirls.setup {
    cmd = { "/Users/skagan/Code/Third_Party_Software/elixir-ls/release/language_server.sh" }
  }

  -- OCaml LS
  require'lspconfig'.ocamllsp.setup{}
end
