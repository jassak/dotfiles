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

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

autocmd FileType vimwiki map c :call ToggleCalendar()<CR>
