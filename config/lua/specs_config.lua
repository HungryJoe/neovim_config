-- Configure specs plugin
-- Link: https://github.com/edluffy/specs.nvim

return function()
  require('specs').setup{
    popup = {
      delay_ms = 10, -- delay before popup displays
      width = 10,
      winhl = "PMenu",
      inc_ms = 7, -- time increments used for fade/resize effects 
      blend = 30, -- starting blend, between 0-100 (fully transparent), see :h winblend
      fader = require('specs').pulse_fader,
      resizer = require('specs').empty_resizer,
      show_jumps  = true,
      min_jump = 20,
      ignore_filetypes = {},
      ignore_buftypes = {
        nofile = true,
      },
    }
  }
end
