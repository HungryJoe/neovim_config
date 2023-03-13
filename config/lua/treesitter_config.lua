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
          ["J"] = {query = {"@class.outer", "@function.outer"}},
        },
        goto_previous_start = {
          ["K"] = {query = {"@class.outer", "@function.outer"}},
        },
      },
      swap = {
        enable = false,
      },
      select = {
        enable = false,
      },
      lsp_interop = {
        enable = false,
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


  -- inject reST syntax highlighting into python docstrings
  require("vim.treesitter.query").set_query("python", "injections", [[
  ((call
    function: (attribute
      object: (identifier) @_re)
    arguments: (argument_list (string) @regex))
   (#eq? @_re "re")
   (#lua-match? @regex "^r.*"))
  ; Module docstring
  ((module . (expression_statement (string) @rst))
   (#offset! @rst 0 3 0 -3))
  ; Class docstring
  ((class_definition
    body: (block . (expression_statement (string) @rst)))
   (#offset! @rst 0 3 0 -3))
  ; Function/method docstring
  ((function_definition
    body: (block . (expression_statement (string) @rst)))
   (#offset! @rst 0 3 0 -3))
  ; Attribute docstring
  (((expression_statement (assignment)) . (expression_statement (string) @rst))
   (#offset! @rst 0 3 0 -3))
  (comment) @comment
  ]])
end
