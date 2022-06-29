-- Configure treesitter plugin
-- Links:
--    Root + Highlight, Indent, and Incremental Selection modules
--      https://github.com/nvim-treesitter/nvim-treesitter
--    Playground & Query Linter Modules
--      https://github.com/nvim-treesitter/playground

return function()
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
      custom_captures = {
        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        -- ["foo.bar"] = "Identifier",
      },
    },
    incremental_selection = {
      enable = false,
      keymaps = {},
    },
    indent = {
      enable = false,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = { -- from within the playground
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      }
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = {"BufWrite", "CursorHold"},
    },
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["J"] = {"@class.inner", "@function.inner"},
        },
        goto_previous_start = {
          ["K"] = {"@class.inner", "@function.inner"},
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["L"] = {"@parameter.inner"},
        },
        swap_previous = {
          ["H"] = {"@parameter.inner"},
        },
      },
      select = {
        lookahead = true,
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["hf"] = "@function.outer",
          ["hF"] = "@function.inner",
          ["hc"] = "@class.outer",
          ["hC"] = "@class.inner",
        },
      },
      lsp_interop = {
        enable = true,
        border = "none",
        peek_definition_code = {
          ["<leader>hh"] = "@function.outer",
          ["<leader>HH"] = "@class.outer",
        },
      },
    },
    matchup = {
      enable = true,
      disable = {},  -- optional, list of language that will be disabled
    }
  }

  -- Enable treesitter-based folds
  vim.api.nvim_win_set_option(0, 'foldmethod', 'expr')
  vim.api.nvim_win_set_option(0, 'foldexpr', 'nvim_treesitter#foldexpr()')
  vim.api.nvim_set_option('foldlevelstart', 99)

  -- Required to compile Haskell parser on OS X
  require'nvim-treesitter.install'.compilers = { "/usr/local/bin/gcc-11" }
end
