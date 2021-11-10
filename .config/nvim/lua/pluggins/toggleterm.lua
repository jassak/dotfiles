require("toggleterm").setup {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return vim.fn.winheight(0)
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<M-t>]],
    -- open_mapping = [[<C-Enter>]],  -- FIXME C-Enter stoped working!
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = 'horizontal', -- | 'horizontal' | 'window' | 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell -- change the default shell
}

-- TODO move to python autocommand
-- FIXME these terminals don't work because expand('%') is called at vim init, not when opening the terminal
-- ipython terminal
local Terminal = require('toggleterm.terminal').Terminal
local ipython = Terminal:new({cmd = "ipython -i " .. vim.fn.expand('%'), hidden = true, close_on_exit = true})
function ipython_toggle() ipython:toggle() end
-- pytest terminal
local Terminal = require('toggleterm.terminal').Terminal
local pytest_term = Terminal:new({cmd = "pytest -x --pdb " .. vim.fn.expand('%'), hidden = true, close_on_exit = false, direction = "window"})
function pytest_toggle() pytest_term:toggle() end

vim.api.nvim_set_keymap('t', 'œ', [[<cmd>q<CR>]], {noremap = true})
vim.api.nvim_set_keymap('t', '<M-q>', [[<cmd>bd!<CR>]], {noremap = true})
