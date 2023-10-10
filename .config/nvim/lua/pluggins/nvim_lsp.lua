-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', ',f', function() vim.lsp.buf.format {async = true} end, bufopts)
end

local nvim_lsp = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local completion_capabilities = require('cmp_nvim_lsp').default_capabilities()
-- merge lsp with completion capabilities
for k,v in pairs(completion_capabilities) do capabilities[k] = v end

local python_root_files = {
    'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git'
}

-- Enable the following language servers
-- for python use pyright or pylsp
local servers = {'pylsp', 'hls', 'jsonls', 'marksman'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = nvim_lsp.util.root_pattern(unpack(python_root_files))
    }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                                                                   {virtual_text = {prefix = ""}})
