-- Configure lspsaga plugin
-- Docs: https://nvimdev.github.io/lspsaga/

return function ()
  require'lspsaga'.setup{
    symbol_in_winbar = {
      separator = " ",
      show_file = false,
    },
    outline = {
      keys = {
        toggle_or_jump = "<Tab>",
        jump = "<Enter>"
      },
    },
    beacon = {
      enabled = false,
    },
    lightbulb = {
      sign = false
    },
  }
end
