vim.cmd([[
let test#python#pytest#options = "--color=yes"
let g:ultest_use_pty = 1
let g:ultest_running_sign = "●"
]])

-- vim-test
vim.api.nvim_set_keymap('n', '<localleader>tt', [[<cmd>TestNearest -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>td', [[<cmd>TestNearest --pdb -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>tr', [[<cmd>TestNearest --trace -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>tf', [[<cmd>TestFile -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>ta', [[<cmd>TestSuite -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>tl', [[<cmd>TestLast -vv<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<localleader>tv', [[<cmd>TestVisit<CR>]], {noremap = true, silent = true})

-- vim-ultest
-- vim.api.nvim_set_keymap('n', '<localleader>ta', [[<cmd>Ultest<CR>]], {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('n', '<localleader>tt', [[<cmd>UltestNearest<CR>]], {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('n', '<localleader>tc', [[<cmd>UltestClear<CR>]], {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('n', '<localleader>ts', [[<cmd>UltestSummary<CR>]], {noremap = true, silent = false})

vim.cmd([[
nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)
]])
