-- Configure the sibling-swap plugin
-- Docs: https://github.com/Wansmer/sibling-swap.nvim

return function()
  require('sibling-swap').setup({
    allow_interline_swaps = true,
    use_default_keymaps = false,
  })
end
