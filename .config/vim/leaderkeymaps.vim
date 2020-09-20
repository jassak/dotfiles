let mapleader=" "       " leader is space

nnoremap <silent><Leader>u :UndotreeToggle<CR>
nnoremap <Leader>§ :call ToggleSpellcheck()<CR>
nnoremap <silent><Leader>e :CocCommand explorer --width 35<CR>
nnoremap <Leader>l :call ToggleNumber()<CR>
nnoremap <Leader>~ :FZF ~<CR>
" Copy paste from CLIPBOARD
map <Leader>Y "+Y
noremap <Leader>P "*P
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
nmap <Leader>t HyyP2lvLr=yyjp

