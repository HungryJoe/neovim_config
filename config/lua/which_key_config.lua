-- Configure which-key plugin
-- Docs: :h which-key

return function ()
  require("which-key").setup{
    plugins = {
      spelling = {
        enabled = true;
      }
    }
  }
end
