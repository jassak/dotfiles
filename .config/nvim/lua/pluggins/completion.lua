local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        -- Tab conflicts with vsnip jumps
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
    },
    sources = cmp.config.sources({
        {name = 'vsnip'}, -- For vsnip users.
        {name = 'buffer', keyword_length = 3},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'path'},
        {name = 'spell', keyword_length = 3},
        {name = 'calc'}
    }),
    experimental = {
        native_menu = false,
        ghost_text = true
    }
})

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
-- capabilities = capabilities
-- }
