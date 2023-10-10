-- Python
vim.cmd [[
augroup filetype_py
    autocmd!
    autocmd FileType python set colorcolumn=89
    autocmd FileType python nnoremap <localleader>bb Obreakpoint()<esc>^
    autocmd FileType python nnoremap <localleader>bc Ofrom celery.contrib import rdb;rdb.set_trace()<esc>^
    autocmd FileType python nnoremap <localleader>bi O__import__("IPython").embed(colors="neutral")<esc>^
    autocmd FileType python nnoremap <localleader>i :split term://ipython -i %<CR>i
    autocmd FileType python nnoremap <localleader>r :split term://python3 -i %<CR>i
    autocmd FileType python nnoremap <localleader>s :!isort % --profile black --force-single-line-imports<CR>
    autocmd FileType python nnoremap <buffer> <localleader>p :w<CR>:split term://python -m cProfile --sort=cumtime %<CR>
augroup END
]]
-- TODO below is not working
-- autocmd FileType python nnoremap <localleader>bc O__import__("celery.contrib.rdb").set_trace()<esc>^

-- Lua
vim.cmd [[
augroup filetype_lua
    autocmd!
    autocmd FileType lua nnoremap <localleader>i :split term://lua -i %<CR>i
augroup END
]]

-- Ledger keys
vim.cmd [[
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
    autocmd FileType ledger nnoremap <buffer> <C-c><C-c> :call ledger#entry()<CR>
]]

-- Remember cursor position
vim.cmd [[
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
]]

-- Haskell
vim.cmd [[
augroup filetype_hs
    autocmd!
    autocmd FileType haskell nnoremap <localleader>i :split term://ghci -i %<CR>i
augroup END
]]

-- Make esc work with fzf
-- https://github.com/junegunn/fzf.vim/issues/544#issuecomment-457456166
vim.cmd [[
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
]]

-- https://vi.stackexchange.com/questions/39200/wrapping-comment-in-visual-mode-not-working-with-gq
vim.api.nvim_create_autocmd('LspAttach', {
   callback = function(args)
     vim.bo[args.buf].formatexpr = nil
   end,
 })
