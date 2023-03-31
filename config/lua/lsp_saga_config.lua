-- Configure lspsaga plugin
-- Docs: :h lspsaga

return function ()
  require'lspsaga'.setup{
    symbol_in_winbar = {
      separator = " ",
      show_file = false,
    },
    lightbulb = {
      enable_in_insert = false
    },
    outline = {
      keys = {
        expand_or_jump = "<Tab>",
      },
    },
    beacon = {
      enabled = false,
    },
  }
end
