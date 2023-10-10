vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>Buffers<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><CR>', [[<cmd>GFiles<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>a', [[<cmd>Files<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>Commits<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bc', [[<cmd>BCommits<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>:', [[<cmd>History:<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>/', [[<cmd>History/<CR>]], {noremap = true, silent = true})