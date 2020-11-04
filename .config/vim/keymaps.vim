inoremap <Up> <C-K>
inoremap <Down> <C-J>
inoremap <Left> <BS>
inoremap <BS> <nop>
xnoremap <BS> <nop>
" inoremap <Right> <Nop>
nnoremap <Up> mmgUiw`m
nnoremap <Down> mmguiw`m
nnoremap <Left> :bp<CR>
nnoremap <right> :bn<CR>
nnoremap <Silent> # #zz
nnoremap <Silent> * *zz
nnoremap <Silent> N Nzz
nnoremap <Silent> g* g*zz
nnoremap <Silent> n nzz
nnoremap <BS> <C-^>
nnoremap <CR> @@
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
nnoremap Y y$
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
xnoremap <  <gv
xnoremap >  >gv
xnoremap <F5> y:Dash <C-r>"<CR>
nnoremap <F5> :Dash<CR>
nnoremap \\ :nohlsearch<CR>
" stolen from tpope's vim-impraired
nnoremap [a :previous<cr>
nnoremap ]a :next<cr>
nnoremap [A :first<cr>
nnoremap ]A :last<cr>
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
nnoremap [B :bfirst<cr>
nnoremap ]B :blast<cr>
nnoremap [t :tprevious<cr>
nnoremap ]t :tnext<cr>
nnoremap [T :tfirst<cr>
nnoremap ]T :tlast<cr>
nnoremap [A :first<cr>
nnoremap ]A :last<cr>
nnoremap [e ddkP
nnoremap ]e ddp
xnoremap [e dkP`]V`[
xnoremap ]e dp`]V`[
nnoremap [<space> O<ESC>j
nnoremap ]<space> o<ESC>k
" comment related
nnoremap !! O <esc>60i-<esc>j^ylk^Pa <esc>yyjp
" Undo points (stolen from https://github.com/dbmrq/dotfiles/blob/master/home/.vim/mappings.vim)
inoremap . .<C-g>u
inoremap , ,<C-g>u
inoremap ; ;<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
" surrounds
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel
nnoremap ∂ yyp
xnoremap ∂ yg`]p
" paste in visual mode
vnoremap p "_dP

if has('nvim')
    tnoremap <C-[><C-[> <C-\><C-n>
    tnoremap ˙ <C-\><C-N><C-w>h
    tnoremap ∆ <C-\><C-N><C-w>j
    tnoremap ˚ <C-\><C-N><C-w>k
    tnoremap ¬ <C-\><C-N><C-w>l
    inoremap ˙ <C-\><C-N><C-w>h
    inoremap ∆ <C-\><C-N><C-w>j
    inoremap ˚ <C-\><C-N><C-w>k
    inoremap ¬ <C-\><C-N><C-w>l
    nnoremap ˙ <C-w>h
    nnoremap ∆ <C-w>j
    nnoremap ˚ <C-w>k
    nnoremap ¬ <C-w>l
endif
