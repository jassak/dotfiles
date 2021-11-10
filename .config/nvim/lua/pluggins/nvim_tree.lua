-- following options are the default
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
    diagnostics = {enable = true, icons = {hint = "", info = "", warning = "", error = ""}},
    view = {
        mappings = {
            list = {
                {key = {"l", "<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit")},
                {key = {"h", "<BS>"}, cb = tree_cb("close_node")}
            }
        }
    }
}

vim.cmd([[
let g:nvim_tree_ignore = [ '.git' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_show_icons = { 'git': 1, 'folders': 1, 'files': 1, 'folder_arrows': 1 }
]])

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', {noremap = true})
