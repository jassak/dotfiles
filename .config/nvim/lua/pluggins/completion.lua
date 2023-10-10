local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(), --  WARNING Conflict with tmux
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'vsnip'}, -- For vsnip users.
    {name = 'nvim_lua'},
    {name = 'path'},
    {name = 'spell', keyword_length = 3},
    {name = 'calc'}
  }, {
    { name = 'buffer', keyword_length = 3}
  }),
  sorting =  {
    comparators = {
      cmp.config.compare.recently_used,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    }
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})
cmp.setup.filetype('ledger', {
  sources = cmp.config.sources({
    { name = 'vsnip' },
    { name = 'buffer' },
  }, {
    { name = 'spell', keyword_length = 3 },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  -- mapping = cmp.mapping.preset.cmdline(),  -- BUG: no tab complete on command line
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' },
  })
})
