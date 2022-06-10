-- Configure telescope plugin
-- Link: https://github.com/nvim-telescope/telescope.nvim

return function()
  require('telescope').setup{}
  require('telescope').load_extension('fzf')
end
