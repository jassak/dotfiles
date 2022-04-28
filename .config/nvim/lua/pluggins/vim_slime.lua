vim.g.slime_target = "neovim"
-- use in ipython
vim.g.slime_python_ipython = nil

-- Toggle ipython mode
vim.api.nvim_set_keymap('n', '<C-c>v', [[<cmd>SlimeConfig<CR>]], {noremap = false})
vim.api.nvim_set_keymap('n', '<C-c>j', [[<cmd>echo b:terminal_job_id<CR>]], {noremap = false})
vim.api.nvim_set_keymap('n', '<C-c>i', [[<cmd>lua require"functions".toggle_slime_ipython_mode()<CR>]], {noremap = false})
vim.api.nvim_set_keymap('n', '<C-c>t', [[<cmd>let g:slime_target = "tmux"<CR>]], {noremap = false})
vim.api.nvim_set_keymap('n', '<C-c>n', [[<cmd>let g:slime_target = "neovim"<CR>]], {noremap = false})
-- Send paragraph and move to next
vim.api.nvim_set_keymap('n', '<C-c><C-c>', [[<Plug>SlimeParagraphSend<CR>]], {noremap = false})
