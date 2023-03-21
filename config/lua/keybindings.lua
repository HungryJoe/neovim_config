-- Create custom keybindings

return function()
  local opts = {noremap = true, silent = true}

  -- Bufferline
  -- These commands will navigate through buffers in order regardless of which mode you are using
  -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
  vim.keymap.set("n", "gl", "<CMD>BufferLineCycleNext<CR>", opts)
  vim.keymap.set("n", "gh", "<CMD>BufferLineCyclePrev<CR>", opts)
  -- These commands will move the current buffer backwards or forwards in the bufferline
  vim.keymap.set("n", "g]", "<CMD>BufferLineMoveNext<CR>", opts)
  vim.keymap.set("n", "g[", "<CMD>BufferLineMovePrev<CR>", opts)
  -- Pick which buffer to go to next
  vim.keymap.set("n", "gp", "<CMD>BufferLinePick<CR>", opts)

  -- Diagnostic
  vim.keymap.set("n", "<leader>dj", function() require'lspsaga.diagnostic':goto_next() end,
    opts
  )
  vim.keymap.set("n", "<leader>dk", function() require'lspsaga.diagnostic':goto_prev() end,
    opts
  )

  -- LSP
  vim.keymap.set("n", "<leader>dd", "<CMD>Lspsaga goto_definition<CR>",
    opts
  )
  vim.keymap.set("n", "<leader>di",
    "<CMD>Lspsaga code_action<CR>",
    opts
  )
  vim.keymap.set("n", "<leader>dr", "<CMD>Lspsaga rename<CR>",
    opts
  )
  vim.keymap.set("n", "<leader>dh", "<CMD>Lspsaga hover_doc<CR>",
    opts
  )
  vim.keymap.set("n", "<leader>do", "<CMD>Lspsaga outline<CR>", opts)

  -- Trouble
  vim.keymap.set("n", "<leader>rr", "<CMD>TroubleToggle<CR>", opts)
  vim.keymap.set("n", "<leader>rw",
    "<CMD>Trouble workspace_diagnostics<CR>",
    opts
  )
  vim.keymap.set("n", "<leader>rd",
    "<CMD>Trouble document_diagnostics<CR>",
    opts
  )
  vim.keymap.set("n", "<leader>re",
    "<CMD>Trouble lsp_references<CR>",
    opts
  )
  vim.keymap.set("n", "<leader>di", "<CMD>Trouble lsp_type_definitions<CR>", opts)

  -- Gitsigns
  vim.keymap.set("n", "<leader>jj", require"gitsigns.actions".next_hunk, opts)
  vim.keymap.set("n", "<leader>jk", require"gitsigns.actions".prev_hunk, opts)
  vim.keymap.set("n", "<leader>jp", require"gitsigns.actions".preview_hunk, opts)
  vim.keymap.set("n", "<leader>jl", require"gitsigns.actions".toggle_current_line_blame, opts)
  vim.keymap.set("n", "<leader>jr", require"gitsigns.actions".reset_hunk, opts)

  -- Treesitter Playground
  vim.keymap.set("n", "<leader>pp", "<CMD>TSPlaygroundToggle<CR>", opts)

  -- Telescope
  vim.keymap.set("n", "<leader>tf", require"telescope.builtin".find_files, opts)
  vim.keymap.set("n", "<leader>td", require"telescope.builtin".current_buffer_fuzzy_find, opts)
  vim.keymap.set("n", "<leader>tw", require"telescope.builtin".live_grep, opts)
  vim.keymap.set("v", "<leader>tw", require"telescope.builtin".grep_string, opts)
  vim.keymap.set("n", "<leader>tp", "<CMD> Telescope yank_history<CR>", opts)

  -- Yanky
  vim.keymap.set("n", "y", "<Plug>(YankyYank)", opts)

  -- Neogen
  vim.keymap.set("n", "<leader>g", require'neogen'.generate, opts)

  -- Sibling-swap
  vim.keymap.set("n", "H", require'sibling-swap'.swap_with_left, opts)
  vim.keymap.set("n", "L", require'sibling-swap'.swap_with_right, opts)

  -- Luasnip
  vim.keymap.set({"i", "n"}, "<C-l>", require'luasnip'.expand_or_jump, opts)
end
