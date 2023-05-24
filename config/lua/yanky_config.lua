-- Configure yanky plugin
-- Docs: :h yanky

return function ()
  require('yanky').setup({
    highlight = {
      timer = 250
    },
  })
end
