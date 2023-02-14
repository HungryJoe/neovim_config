-- Configure lspsaga plugin
-- Docs: :h lspsaga

return function ()
  require'lspsaga'.setup{
    symbol_in_winbar = {
      separator = " ",
      show_file = false,
    },
  }
end
