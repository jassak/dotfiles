inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
nnoremap <Silent> # #zz
nnoremap <Silent> * *zz
nnoremap <Silent> N Nzz
nnoremap <Silent> g* g*zz
nnoremap <Silent> n nzz
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
xmap <F5> y:Dash <C-r>"<CR>
nmap <F5> :Dash<CR>
nmap \\ :nohlsearch<CR>
" stolen from tpope's vim-impraired
nmap [a :previous<cr>
nmap ]a :next<cr>
nmap [A :first<cr>
nmap ]A :last<cr>
nmap [b :bprevious<cr>
nmap ]b :bnext<cr>
nmap [B :bfirst<cr>
nmap ]B :blast<cr>
nmap [t :tprevious<cr>
nmap ]t :tnext<cr>
nmap [T :tfirst<cr>
nmap ]T :tlast<cr>
nmap [A :first<cr>
nmap ]A :last<cr>
nmap [e ddkP
nmap ]e ddp
xmap [e dkP`]V`[
xmap ]e dp`]V`[
" comment related FIXME
nmap !! HyyP2lvLr=yyjp
nmap !# H"aylO#b<ESC>La<space><ESC>"apyyjpkA<ESC>50a<space><Esc>H49\|"aplDH

iabbr #b ==============================================
