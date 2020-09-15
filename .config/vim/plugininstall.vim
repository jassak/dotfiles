if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
"Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()
