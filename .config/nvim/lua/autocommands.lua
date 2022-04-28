-- Python
vim.cmd[[
augroup filetype_py
    autocmd!
    autocmd FileType python set colorcolumn=89
    autocmd FileType python nnoremap <localleader>bb Obreakpoint()<esc>^
    autocmd FileType python nnoremap <localleader>bc Ofrom celery.contrib import rdb;rdb.set_trace()<esc>^
    autocmd FileType python nnoremap <localleader>bi Ofrom IPython import embed; embed()<esc>^
    autocmd FileType python nnoremap <localleader>i :split term://ipython -i %<CR>i
    autocmd FileType python nnoremap <localleader>r :split term://python %<CR>i
augroup END
]]

-- Ledger keys
vim.cmd[[
augroup filetype_ledger
    autocmd!
    autocmd FileType ledger nnoremap <buffer> <localleader>gr RGroceries<ESC>
    autocmd FileType ledger nnoremap <buffer> <localleader>ph RHealth:Pharmacy<ESC>
    autocmd FileType ledger nnoremap <buffer> <localleader>re RFood:Restaurants<ESC>
    autocmd FileType ledger nnoremap <buffer> <localleader>do RHealth:Doctor<ESC>
    autocmd FileType ledger xnoremap <silent> <Tab> :LedgerAlign<CR>
    autocmd FileType ledger nnoremap <buffer> <localleader>gp o; :PERSONAL:<ESC>
    autocmd FileType ledger nnoremap <buffer> <localleader>gj o; :JOINT:<ESC>
    autocmd FileType ledger nnoremap <buffer> <localleader>gs o; :SG:<ESC>
]]

-- Remember cursor position
vim.cmd[[
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]]


-- cooklang
vim.cmd[[
augroup filetype_cook
    autocmd!
    autocmd FileType cook nnoremap <leader>i ebi@ea{}i
    autocmd FileType cook nnoremap <leader>ι ebi@ea{}i
    autocmd FileType cook vnoremap <leader>i di@{}hPf{a
    autocmd FileType cook vnoremap <leader>ι di@{}hPf{a
augroup END
]]
