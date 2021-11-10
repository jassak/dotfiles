-- Set leader and localleader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- Copy to clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>Y', '"+y$', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true})

-- Paste from clipboard
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>P', '"+P', {noremap = true})

-- Source init.lua
vim.api.nvim_set_keymap('n', '<leader><CR>', [[<cmd>source %<CR>]], {noremap = true})

-- Save, quit etc
vim.api.nvim_set_keymap('n', '<M-w>', [[<cmd>w<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<M-q>', [[<cmd>q<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<M-x>', [[<cmd>x<CR>]], {noremap = true})

-- Move between windows
vim.api.nvim_set_keymap('n', '<M-h>', [[<c-w>h]], {noremap = true})
vim.api.nvim_set_keymap('n', '<M-j>', [[<c-w>j]], {noremap = true})
vim.api.nvim_set_keymap('n', '<M-k>', [[<c-w>k]], {noremap = true})
vim.api.nvim_set_keymap('n', '<M-l>', [[<c-w>l]], {noremap = true})
-- Move windows
vim.api.nvim_set_keymap('n', '<M-H>', [[<c-w>H]], {noremap = true})
vim.api.nvim_set_keymap('n', '<M-J>', [[<c-w>J]], {noremap = true})
vim.api.nvim_set_keymap('n', '<M-K>', [[<c-w>K]], {noremap = true})
vim.api.nvim_set_keymap('n', '<M-L>', [[<c-w>L]], {noremap = true})
-- No Q
vim.api.nvim_set_keymap('n', 'Q', [[gq]], {noremap = true})

-- Easy uppercase/lowercase
vim.api.nvim_set_keymap('n', '<Up>', [[gUiww]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', [[guiww]], {noremap = true})

-- Move and center
vim.api.nvim_set_keymap('n', '#', [[#zz]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '*', [[*zz]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', [[Nzz]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'n', [[nzz]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'g*', [[g*zz]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'J', [[mzJ`z]], {noremap = true, silent = true})

-- Move text around
vim.api.nvim_set_keymap('x', '<c-j>', [[:m '>+1<CR>gv=gv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<c-k>', [[:m '<-2<CR>gv=gv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<c-h>', [[<gv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<c-l>', [[>gv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<c-j>', [[<esc>:m .+1<CR>==li]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<c-k>', [[<esc>:m .-2<CR>==li]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-j>', [[:m .+1<CR>==]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-k>', [[:m .-2<CR>==]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-h>', [[<<]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-l>', [[>>]], {noremap = true, silent = true})

-- Double line(s)
vim.api.nvim_set_keymap('n', '<M-d>', [[yyp]], {noremap = true})
vim.api.nvim_set_keymap('x', '<M-d>', [[yg`]p]], {noremap = true})

-- Paste in visual mode
-- NOTE x is needed instead of v because we don't want to use p as paste in select mode
vim.api.nvim_set_keymap('x', 'p', [["_dP]], {noremap = true})

-- Quickfix
vim.api.nvim_set_keymap('n', '<M-f>', [[<cmd>copen<CR>]], {noremap = true})

-- Enter normal mode in terminal
vim.api.nvim_set_keymap('t', '<C-[>', [[<C-\><C-N>]], {noremap = true})

-- Move to other window from terminal
vim.api.nvim_set_keymap('t', '<M-h>', [[<C-\><C-N><c-w>h]], {noremap = true})
vim.api.nvim_set_keymap('t', '<M-j>', [[<C-\><C-N><c-w>j]], {noremap = true})
vim.api.nvim_set_keymap('t', '<M-k>', [[<C-\><C-N><c-w>k]], {noremap = true})
vim.api.nvim_set_keymap('t', '<M-l>', [[<C-\><C-N><c-w>l]], {noremap = true})

-- Spellcheck
vim.api.nvim_set_keymap('n', '<leader>§', [[<cmd>lua require"functions".toggle_spell_check()<CR>]], {noremap = false})
vim.api.nvim_set_keymap('n', '<leader>1', [[<cmd>lua require"functions".set_spelllang_en()<cr>]], {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>2', [[<cmd>lua require"functions".set_spelllang_el()<cr>]], {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>3', [[<cmd>lua require"functions".set_spelllang_fr()<cr>]], {noremap = false, silent = false})

-- Python specific TODO move to autocomands
-- python breakpoint
vim.api.nvim_set_keymap('n', '<localleader>b', [[Obreakpoint()<esc>^]], {noremap = false})
-- ipython
-- vim.api.nvim_set_keymap('n', '<localleader>i', [[<cmd>lua ipython_toggle()<CR>]], {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<localleader>i', [[:split term://ipython -i %<CR>i]], {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<localleader>r', [[:split term://python %<CR>i]], {noremap = true, silent = false})
-- pytest debug
-- vim.api.nvim_set_keymap('n', '<localleader>td', [[<cmd>lua pytest_toggle()<CR>]], {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<localleader>td', [[:tabnew term://pytest -x --lf --pdb %<CR>i]], {noremap = true, silent = false})