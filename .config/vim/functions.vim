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

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocActionAsync('doHover')
"   endif
" endfunction

function! ToggleCalendar()
  execute ":Calendar -view=year -split=vertical -width=30 -position=left"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

