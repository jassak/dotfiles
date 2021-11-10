-- Python
vim.cmd[[
augroup filetype_py
    autocmd!
    autocmd FileType python set colorcolumn=89
augroup END
]]

-- Clean up bank statements in .txt file for ledger
vim.cmd[[
augroup filetype_txt
    autocmd!
    autocmd BufRead,BufNewFile *.txt nnoremap <buffer> <localleader>cc :6,$g/^[^0-9]\\|^$/d<CR>:1,4g/^[^0-9]\\|^$/d<CR>
]]

-- Ledger keys
vim.cmd[[
augroup filetype_ledger
    autocmd!
    autocmd FileType ledger nnoremap <buffer> <localleader>gr RGroceries<ESC>
    autocmd FileType ledger nnoremap <buffer> <localleader>ph RHealth:Pharmacy<ESC>
    autocmd FileType ledger nnoremap <buffer> <localleader>re RFood:Restaurants<ESC>
    autocmd FileType ledger nnoremap <buffer> <localleader>do RHealth:Doctor<ESC>
    autocmd FileType ledger noremap { ?^\d<CR>
    autocmd FileType ledger noremap } /^\d<CR>
    autocmd FileType ledger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
    autocmd FileType ledger vnoremap <silent> <Tab> :LedgerAlign<CR>
]]
