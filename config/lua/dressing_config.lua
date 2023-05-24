-- Configure dressing.nvim plugin
-- Docs: :h dressing

return function ()
  require'dressing'.setup{
    select = {
        backend = { "builtin", "telescope", "fzf", "fzf_lua", "nui" },
    }
  };
end
