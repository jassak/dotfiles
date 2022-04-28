require('formatter').setup({
    logging = false,
    filetype = {
        -- javascript = {
        --     -- prettier
        --    function()
        --       return {
        --         exe = "prettier",
        --         args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
        --         stdin = true
        --       }
        --     end
        -- },
        -- rust = {
        --     -- Rustfmt
        --     function() return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true} end
        -- },
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
        -- cpp = {
        --     -- clang-format
        --    function()
        --       return {
        --         exe = "clang-format",
        --         args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
        --         stdin = true,
        --         cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
        --       }
        --     end
        -- }
        python = {
            function()
                return {exe = "black", args = { '-' }, stdin = true}
            end
        }
    }
})
-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.py FormatWrite
-- augroup END
-- ]], true)

-- XXX leader f conflicts with telescope commands
vim.api.nvim_set_keymap('n', '<localleader>f', [[<cmd>Format<CR>]], {noremap = true})
