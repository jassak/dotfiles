vim.cmd([[
let test#python#pytest#options = "--color=yes"
]])

-- vim-test
vim.api.nvim_set_keymap('n', '<localleader>tt', [[<cmd>TestNearest -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>td', [[<cmd>TestNearest --pdb -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>tr', [[<cmd>TestNearest --trace -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>tf', [[<cmd>TestFile -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>ta', [[<cmd>TestSuite -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>tl', [[<cmd>TestLast -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>tv', [[<cmd>TestVisit<CR>]], {noremap = true, silent = true})
