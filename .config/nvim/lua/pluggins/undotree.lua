-- vim.cmd[[
-- if has("persistent_undo")
--    let target_path = expand('~/.vimdid')

--     " create the directory and any parent directories
--     " if the location does not exist.
--     if !isdirectory(target_path)
--         call mkdir(target_path, "p", 0700)
--     endif

--     let &undodir=target_path
--     set undofile
-- endif
-- ]]

vim.api.nvim_set_keymap('n', '<F5>', '<cmd>UndotreeToggle<CR>', {noremap = true})
