-- Configure autopairs plugin
-- Docs: :h autopairs

return function ()
  require'nvim-autopairs'.setup{
    check_ts = true,
    enable_afterquote = false,
  }
end
