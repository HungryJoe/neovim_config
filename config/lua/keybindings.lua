-- Create custom keybindings

return function()
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  local opts = {noremap = true, silent = true}

  -- Bufferline
  -- These commands will navigate through buffers in order regardless of which mode you are using
  -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
  vim.api.nvim_set_keymap("n", "gl", "<CMD>BufferLineCycleNext<CR>", opts)
  vim.api.nvim_set_keymap("n", "gh", "<CMD>BufferLineCyclePrev<CR>", opts)
  -- These commands will move the current buffer backwards or forwards in the bufferline
  vim.api.nvim_set_keymap("n", "g]", "<CMD>BufferLineMoveNext<CR>", opts)
  vim.api.nvim_set_keymap("n", "g[", "<CMD>BufferLineMovePrev<CR>", opts)
  -- Pick which buffer to go to next
  vim.api.nvim_set_keymap("n", "gp", "<CMD>BufferLinePick<CR>", opts)

  -- Diagnostic
  vim.api.nvim_set_keymap("n", t"<leader>dj", "<CMD>lua require'lspsaga.diagnostic':goto_next()<CR>",
    opts
  )
  vim.api.nvim_set_keymap("n", t"<leader>dk", "<CMD>lua require'lspsaga.diagnostic':goto_prev()<CR>",
    opts
  )

  -- LSP
  vim.api.nvim_set_keymap("n", t"<leader>dd", "<CMD>Lspsaga goto_definition<CR>",
    opts
  )
  vim.api.nvim_set_keymap("n", t"<leader>di",
    "<CMD>Lspsaga code_action<CR>",
    opts
  )
  vim.api.nvim_set_keymap("n", t"<leader>dr", "<CMD>Lspsaga rename<CR>",
    opts
  )
  vim.api.nvim_set_keymap("n", t"<leader>dh", "<CMD>Lspsaga hover_doc<CR>",
    opts
  )

  -- Trouble
  vim.api.nvim_set_keymap("n", t"<leader>rr", "<CMD>TroubleToggle<CR>", opts)
  vim.api.nvim_set_keymap("n", t"<leader>rw",
    "<CMD>Trouble workspace_diagnostics<CR>",
    opts
  )
  vim.api.nvim_set_keymap("n", t"<leader>rd",
    "<CMD>Trouble document_diagnostics<CR>",
    opts
  )
  vim.api.nvim_set_keymap("n", t"<leader>re",
    "<CMD>Trouble lsp_references<CR>",
    opts
  )
  vim.api.nvim_set_keymap("n", t"<leader>dt", "<CMD>Trouble lsp_type_definitions<CR>", opts)

  -- Gitsigns
  vim.api.nvim_set_keymap("n", t"<leader>jj", "<CMD>Gitsigns next_hunk<CR>", opts)
  vim.api.nvim_set_keymap("n", t"<leader>jk", "<CMD>Gitsigns prev_hunk<CR>", opts)
  vim.api.nvim_set_keymap("n", t"<leader>jp", "<CMD>Gitsigns preview_hunk<CR>", opts)
  vim.api.nvim_set_keymap("n", t"<leader>jl", "<CMD>Gitsigns toggle_current_line_blame<CR>", opts)
  vim.api.nvim_set_keymap("n", t"<leader>jr", "<CMD>Gitsigns reset_hunk<CR>", opts)

  -- Treesitter Playground
  vim.api.nvim_set_keymap("n", t"<leader>pp", "<CMD>TSPlaygroundToggle<CR>", opts)

  -- Telescope
  vim.api.nvim_set_keymap("n", t"<leader>tf", "<CMD>Telescope find_files<CR>", opts)
  vim.api.nvim_set_keymap("n", t"<leader>td", "<CMD>Telescope current_buffer_fuzzy_find<CR>", opts)
  vim.api.nvim_set_keymap("n", t"<leader>tw", "<CMD>Telescope live_grep<CR>", opts)
  vim.api.nvim_set_keymap("v", t"<leader>tw", "<CMD>Telescope grep_string<CR>", opts)
  vim.api.nvim_set_keymap("n", t"<leader>tp", "<CMD>Telescope yank_history<CR>", opts)

  -- Yanky
  vim.api.nvim_set_keymap("n", "y", "<Plug>(YankyYank)", opts)

  -- Neogen
  vim.keymap.set("n", "<leader>g", require'neogen'.generate, opts)

  -- Sibling-swap
  vim.keymap.set("n", "H", require'sibling-swap'.swap_with_left, opts)
  vim.keymap.set("n", "L", require'sibling-swap'.swap_with_right, opts)
end
