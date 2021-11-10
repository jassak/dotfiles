local M = {}

-- Spellcheck
function M.toggle_spell_check()
    if vim.opt.spell:get() then
        vim.opt.spell = false
        vim.api.nvim_echo({{'Spellcheck off'}}, false, {})
    else
        vim.opt.spell = true
        vim.api.nvim_echo({{'Spellcheck on'}}, false, {})
    end
end
function M.set_spelllang_en()
    vim.opt.spelllang = "en"
    vim.api.nvim_echo({{'English'}}, false, {})
end
function M.set_spelllang_el()
    vim.opt.spelllang = "el"
    vim.api.nvim_echo({{'Greek'}}, false, {})
end
function M.set_spelllang_fr()
    vim.opt.spelllang = "fr"
    vim.api.nvim_echo({{'French'}}, false, {})
end

-- Toggle ipython mode in vim-slime
function M.toggle_slime_ipython_mode()
    if vim.g.slime_python_ipython == nil then
        vim.g.slime_python_ipython = 1
        vim.api.nvim_echo({{'ipython mode on'}}, false, {})
    else
        vim.g.slime_python_ipython = nil
        vim.api.nvim_echo({{'ipython mode off'}}, false, {})
    end
end

return M
