let maplocalleader=','

" vim jumps to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"" Fix shell syntax highlight
augroup shellfix 
  " Remove all vimrc autocommands within scope
  autocmd! 
  autocmd BufNewFile,BufRead *.sh   set syntax=zsh
augroup END

" Python syntax extras
augroup python_syntax_extra
  autocmd!
  autocmd! Syntax python :syn keyword Keyword self
augroup END

"" Fix latex syntax highlight
"augroup latexfix 
  "" Remove all vimrc autocommands within scope
  "autocmd! 
  "autocmd BufNewFile,BufRead *.tex   set syntax=context
  "autocmd BufNewFile,BufRead *.cls   set syntax=context
"augroup END

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

au BufRead,BufNewFile *.md setlocal textwidth=80

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.py,*.json :call <SID>StripTrailingWhitespaces()

augroup filetype_json
    autocmd!
    autocmd FileType json setlocal foldmethod=syntax
    autocmd FileType json nnoremap ,yo /{<cr>ya{/}<cr>
    autocmd FileType json nnoremap ,po /{<cr>va{"0p/}<cr>
    autocmd FileType json onoremap f i"
augroup END

augroup filetype_wiki
    autocmd!
    autocmd BufNewFile,BufRead *.wiki nnoremap <buffer> <LocalLeader>m :m$<CR>
    autocmd BufNewFile,BufRead *.wiki xnoremap <buffer> <LocalLeader>m :m$<CR>
    autocmd BufNewFile,BufRead *.wiki xnoremap <buffer> <LocalLeader>o :VimwikiToggleListItem<CR>
augroup END

if has('nvim')
    augroup filetype_py
        autocmd!
        autocmd FileType python set colorcolumn=89
        autocmd FileType python nnoremap ) zj
        autocmd FileType python nnoremap ( zk
        autocmd FileType python nnoremap <buffer> <LocalLeader>t :split term://python %<CR>i
        autocmd FileType python nnoremap <buffer> <LocalLeader>d :split term://python -m pdb %<CR>i
        autocmd FileType python nnoremap <buffer> <LocalLeader>p :split term://python -m cProfile --sort=cumtime %<CR>i
        autocmd FileType python nnoremap <buffer> <LocalLeader>i :split term://ipython -i %<CR>i
        autocmd FileType python nnoremap <buffer> <LocalLeader>vt :vsplit term://python %<CR>i
        autocmd FileType python nnoremap <buffer> <LocalLeader>vd :vsplit term://python -m pdb %<CR>i
        autocmd FileType python nnoremap <buffer> <LocalLeader>vp :vsplit term://python -m cProfile --sort=cumtime %<CR>i
        autocmd FileType python nnoremap <buffer> <LocalLeader>vi :vsplit term://ipython -i %<CR>i
    augroup END
else
    augroup filetype_py
        autocmd!
        autocmd FileType python set colorcolumn=89
        autocmd FileType python nnoremap ) zj
        autocmd FileType python nnoremap ( zk
        autocmd FileType python nnoremap <buffer> <LocalLeader>t :terminal python %<CR>
        autocmd FileType python nnoremap <buffer> <LocalLeader>d :terminal++close python -m pdb %<CR>
        autocmd FileType python nnoremap <buffer> <LocalLeader>p :terminal python -m cProfile --sort=cumtime %<CR>
        autocmd FileType python nnoremap <buffer> <LocalLeader>i :terminal++close ipython -i %<CR>
        autocmd FileType python nnoremap <buffer> <LocalLeader>vt :vert terminal python %<CR>
        autocmd FileType python nnoremap <buffer> <LocalLeader>vd :vert terminal++close python -m pdb %<CR>
        autocmd FileType python nnoremap <buffer> <LocalLeader>vp :vert terminal python -m cProfile --sort=cumtime %<CR>
        autocmd FileType python nnoremap <buffer> <LocalLeader>vi :vert terminal++close ipython -i %<CR>
    augroup END
endif
