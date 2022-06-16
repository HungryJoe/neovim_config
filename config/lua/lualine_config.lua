-- Configure lualine plugin
-- See :h lualine for docs

return function()
  local gps = require("nvim-gps")

  -- set noshowmode  " Don't show mode below the statusline
  vim.api.nvim_set_option('showmode', false)

  local function progress()
    local progress = math.ceil((vim.fn.line('.') - 1) * 100 / vim.fn.line('$'))
    local str = string.format([[%d%%%%]], progress)
    return str
  end

  require('lualine').setup {
     options = {
      theme = 'tokyonight',
      section_separators = {left = '', right = ''},
      component_separators = {left = '', right = ''},
      icons_enabled = true,
      disabled_filetypes = {},
    },
    sections = {
      lualine_a = {{'filename', path = 3, shorting_target = 100}},
      lualine_b = {{gps.get_location, cond = gps.is_available}},
      lualine_c = {},
      lualine_x = {{'diagnostics', sources = {'nvim_diagnostic'}}},
      -- lualine_y = {'branch'},
      lualine_y = {},
      lualine_z = {progress, 'location'},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {},
   }
end
