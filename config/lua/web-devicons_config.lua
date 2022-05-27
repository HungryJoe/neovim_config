-- Web-devicon config
-- Link: https://github.com/kyazdani42/nvim-web-devicons

return function()
  require'nvim-web-devicons'.setup {
     -- your personnal icons can go here (to override)
     override = {},
     -- globally enable default icons (default to false)
     -- will get overriden by `get_icons` option
     default = false,
  }

end
