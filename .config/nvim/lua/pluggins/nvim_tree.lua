-- following options are the default

vim.cmd([[
let g:nvim_tree_git_hl = 0 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_show_icons = { 'git': 1, 'folders': 1, 'files': 1, 'folder_arrows': 1 }
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
]])

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
    disable_netrw       = false,
    hijack_netrw        = false,
    diagnostics = {enable = true, icons = {hint = "", info = "", warning = "", error = ""}},
    filters = {
        dotfiles = true
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    ignore = { '.git' },
    view = {
        mappings = {
            list = {
                {key = {"l", "<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit")},
                {key = {"h", "<BS>"}, cb = tree_cb("close_node")}
            }
        }
    }
}

vim.api.nvim_set_keymap('n', '<M-f>', '<cmd>NvimTreeToggle<CR>', {noremap = true})


-- project.nvim config
vim.g.nvim_tree_respect_buf_cwd = 1

require("nvim-tree").setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})
