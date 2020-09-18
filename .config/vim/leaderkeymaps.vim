let mapleader=" "       " leader is space

nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>d :nohlsearch<CR>
nnoremap <Leader>§ :call ToggleSpellcheck()<CR>
nnoremap <Leader>e :CocCommand explorer --width 35<CR>
nnoremap <Leader>l :call ToggleNumber()<CR>
nnoremap <Leader>~ :FZF ~<CR>
nnoremap <Leader>v :call TogglePaste()<CR>
" Copy paste from PRIMARY and CLIPBOARD
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p
nmap <Leader><Leader> <C-^>
nmap <Leader>s :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :x<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>g :Commits<CR>
nmap <Leader>h :History<CR>
nmap <Leader>; :History:<CR>
nmap <Leader>/ :History/<CR>
nmap <Leader>rn <Plug>(coc-rename)
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>ac  <Plug>(coc-codeaction)
nmap <Leader>af  <Plug>(coc-fix-current)
nnoremap <silent><nowait> <Leader>aa  :<C-u>CocList diagnostics<CR>
nmap <Leader>o :VimwikiToggleListItem<CR>
