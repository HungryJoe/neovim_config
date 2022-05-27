-- Cmp config
-- Source: https://github.com/hrsh7th/nvim-cmp

return function()
  vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

  local cmp = require'cmp'
  local compare = require('cmp.config.compare')
  local types = require('cmp.types')
  local WIDE_HEIGHT = 40
  cmp.setup{
    sources = {
      -- Order determines priority,
      --  which affects compare.score like
      --  entry.score = entry.score + (source.priority * priority_weight)
      {name = 'nvim_lsp'},
      {name = 'path'},
      {name = 'buffer'},
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({})
    },
    enabled = function()
      return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
    end,
    completion = {
      autocomplete = {
        types.cmp.TriggerEvent.TextChanged,
      },
      completeopt = 'menu,menuone,noselect',
      keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      keyword_length = 1,
      get_trigger_characters = function(trigger_characters)
        return trigger_characters
      end,
    },
    snippet = {
      expand = function()
        error('snippet engine is not configured.')
      end,
    },
    preselect = types.cmp.PreselectMode.Item,
    window = {
      documentation = {
        border = { '', '', '', ' ', '', '', '', ' ' },
        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
        maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
        maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
      },
    },
    confirmation = {
      default_behavior = types.cmp.ConfirmBehavior.Replace,
      get_commit_characters = function(commit_characters)
        return commit_characters
      end,
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        compare.offset,
        compare.exact,
        compare.score,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    },
    event = {},
    formatting = {
      deprecated = false,
      format = function(_, vim_item)
        return vim_item
      end,
    },
    experimental = {
      ghost_text = false,
    },
  }
end

