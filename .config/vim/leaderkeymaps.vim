let mapleader=" "       " leader is space

nnoremap <silent><nowait> <Leader>aa  :<C-u>CocList diagnostics<CR>
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>ac  <Plug>(coc-codeaction)
nmap <Leader>af  <Plug>(coc-fix-current)
nmap <Leader>b :Buffers<CR>
nmap <Leader>e :GFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>g :Commits<CR>
map <Leader>h :History<CR>
nnoremap <Leader>l :call ToggleNumber()<CR>
noremap <Leader>P "*P
noremap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>rc :source ~/.vimrc<CR>
nmap <Leader>s :w<CR>
if has('nvim')
    nnoremap <silent><Leader>t :split term://zsh<CR>i
    nnoremap <Leader>m :split term://mutt<CR>i
else
    nnoremap <silent><Leader>t :terminal ++close<CR>
    nnoremap <Leader>m :terminal ++close mutt<CR>
endif
nnoremap <silent><Leader>u :UndotreeToggle<CR>
nmap <Leader>wha :VimwikiAll2HTML<CR>
nmap <Leader>x :x<CR>
map <Leader>Y "+Y
noremap <Leader>y "+y

nnoremap <Leader><Leader> za
xnoremap <Leader><Leader> zf
nnoremap <Leader>§ :call ToggleSpellcheck()<CR>
nnoremap <Leader>~ :FZF ~<CR>
nmap <Leader>; :History:<CR>
nmap <Leader>/ :History/<CR>
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)
