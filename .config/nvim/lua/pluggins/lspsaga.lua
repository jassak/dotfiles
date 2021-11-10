local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.api.nvim_set_keymap('n', 'gn', [[<cmd>Lspsaga rename<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gd', [[<cmd>Lspsaga preview_definition<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', [[<cmd>Lspsaga hover_doc<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>Lspsaga signature_help<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-b>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], {noremap = true, silent = true})
