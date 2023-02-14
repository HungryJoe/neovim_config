-- Configure toggler plugin
-- Docs: https://github.com/nguyenvukhang/nvim-toggler/

return function ()
  require'nvim-toggler'.setup{
    inverses = {
      ['>'] = '<',
      ['True'] = 'False',
    }
  }
end
