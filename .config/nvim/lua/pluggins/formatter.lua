require('formatter').setup({
    logging = false,
    filetype = {
        lua = {
            -- luafmt
            function()
                return {
                    exe = "lua-format",
                    args = {"--indent-width", 4, "-i", "--no-use-tab", "--column-limit", 120},
                    stdin = true
                }
            end
        },
        python = {function() return {exe = "black", args = {'--line-length', 88, '-'}, stdin = true} end},
        json = {function() return {exe = "jq", args = {".", "--indent", 4}, stdin = true} end}
    }
})
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py FormatWrite
augroup END
]], true)

vim.api.nvim_set_keymap('n', '<localleader>f', [[<cmd>Format<CR>]], {noremap = true})
