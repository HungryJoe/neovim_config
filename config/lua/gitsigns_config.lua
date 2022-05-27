-- Configure gitsigns plugin
-- Link: https://github.com/lewis6991/gitsigns.nvim/

return function()
  require('gitsigns').setup {
    keymaps = {},
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
    linehl   = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 150, -- in ms
    },
    current_line_blame_formatter_opts = {
      relative_time = false
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    diff_opts = {internal = true},
    yadm = {
      enable = false
    },
  }
end
