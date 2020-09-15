function! ToggleSpellcheck()
    if(&spell == 1)
        set nospell
    else
        set spell
    endif
endfunc

function! TogglePaste()
    if(&paste == 1)
        set nopaste
    else
        set paste
    endif
endfunc

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! s:check_back_space() abort  " coc
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
function! s:show_documentation()  " coc
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
