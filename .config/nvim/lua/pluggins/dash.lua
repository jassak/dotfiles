vim.api.nvim_set_keymap("n", "gk", "<Plug>DashSearch", {noremap = false, silent = true})
vim.cmd[[
let g:dash_map = {'python': 'pytorch'}
]]
