-- Configure tokyonight colorscheme

return function()
  vim.g.tokyonight_colors = {
    green = "#6ece6a",
    yellow = "#f0b78b",
    gitSigns = {
      change = "#895b8a"
    }
  }
  vim.g.tokyonight_style = "storm" -- The theme comes in three styles, storm, a darker variant night, and day.
  vim.g.tokyonight_terminal_colors = true -- Configure the colors used when opening a :terminal in Neovim
  vim.g.tokyonight_italic_comments = true
  vim.g.tokyonight_italic_keywords = true
  vim.g.tokyonight_italic_functions = false
  vim.g.tokyonight_italic_variables = false
  vim.g.tokyonight_transparent = false -- Enable this to disable setting the background color
  vim.g.tokyonight_hide_inactive_statusline = false
  -- Set a darker background on sidebar-like windows. For example: ["qf", "vista_kind", "terminal", "packer"]
  vim.g.tokyonight_sidebars = {"packer"}
  vim.g.tokyonight_transparent_sidebar = false
  vim.g.tokyonight_dark_sidebar = true
  vim.g.tokyonight_dark_float = true
  -- Adjusts the brightness of the colors of the Day style. Number between 0 and 1, from dull to vibrant colors
  vim.g.tokyonight_day_brightness = 0.3
  vim.g.tokyonight_lualine_bold = false -- When true, section headers in the lualine theme will be bold (broken?)
end
