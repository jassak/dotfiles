require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column',
            '--smart-case'
        },
        mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}, i = {["<esc>"] = require('telescope.actions').close}}
    },
}

vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>Telescope<CR>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader><CR>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').man_pages()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fj', [[<cmd>lua require('telescope.builtin').jumplist()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]], {noremap = true, silent = true})
