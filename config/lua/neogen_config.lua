-- Configure neogen plugin
-- Docs: :h neogen

return function ()
  require'neogen'.setup{
    snippet_engine = "luasnip",
    languages = {
      python = {
        template = {
          annotation_convention = "reST"
        }
      }
    }
  }
end
