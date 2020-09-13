"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible   " VI compatible mode is disabled so that VIm things work
filetype off       " Required by Vundle
set hidden         " Allows hidden buffers https://medium.com/usevim/vim-101-set-hidden-f78800142855
set relativenumber " Relative line numbers by default
filetype plugin on

" Plugins with vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
" Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'vimwiki/vimwiki'
Plug 'cespare/vim-toml'
Plug 'preservim/nerdcommenter'
Plug 'chriskempson/base16-vim'
Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'

" Initialize plugin system
call plug#end()


" Following https://dougblack.io/words/a-good-vimrc.html and 
" https://github.com/JJGO/dotfiles/blob/master/vim/.vimrc

" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-black-metal
syntax enable           " enable syntax processing

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tabstop=4       " number of visual spaces per TAB
"set softtabstop=4   " number of spaces in tab when editing
set smarttab
set shiftwidth=4
set expandtab       " tabs are spaces

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype specific plugin files
set wildmenu            " visual autocomplete for command menu
" set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set laststatus=2        " Show the status line at the bottom
" set mouse+=a            " A necessary evil, mouse support
set noerrorbells visualbell t_vb=    "Disable annoying error noises
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
set signcolumn=yes      " Always draw sign column. Prevent buffer moving when adding/deleting sign.
" Sane splits
set splitright
set splitbelow
" Permanent undo
set undodir=~/.vimdid
set undofile
" Optimize for fast terminal connections
set ttyfast

" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered
let g:sneak#s_next = 1
" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
"cnoremap %s/ %sm/

" Leader Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "       " leader is space
" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>
" save session
nnoremap <leader>ms :mksession<CR>
" Ctrl+h to stop searching
nnoremap <ESC> :nohlsearch<cr>
" Spellcheck
function! ToggleSpellcheck()
    if(&spell == 1)
        set nospell
    else
        set spell
    endif
endfunc
nnoremap <leader>sc :call ToggleSpellcheck()<cr>
" <leader><leader> toggles between buffers
nnoremap <CR><CR> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>
" Show those damn hidden characters
" " Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,trail:•,nbsp:⎵
" Stupid hack to make autopairs go away
let g:AutoPairsLoaded = 0
nnoremap <space>ce :CocCommand explorer --width 35<CR>
"nnoremap <space>bf :CocCommand explorer --preset floatingBuffers --sources buffer+<CR>

" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap + za
set foldmethod=indent   " fold based on indent level

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

" Bakups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" If you leave a Vim process open in which you've changed file, Vim creates 
" a "backup" file. Then, when you open the file from a different Vim session, 
" Vim knows to complain at you for trying to edit a file that is already being edited. 
" The "backup" file is created by appending a ~ to the end of the file in the 
" current directory. This can get quite annoying when browsing around a directory, 
" so I applied the following settings to move backups to the /tmp folder.
" backup and writebackup enable backup support. As annoying as this can be, it
" is much better than losing tons of work in an edited-but-not-written file.

" Nerd Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>l :call ToggleNumber()<CR>

" Uncomment the following to have Vim jump to the last position when                                                       
" " reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --INSERT-- is unncessary because of lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Coc-snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

"" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

"" Use <Down> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<Down>'

"" Use <Up> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<Up>'

"" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = ['']
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, {'z': '~/.zshrc'} ]

" Vim GitGutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100
"map <Leader>gi :GitGutterToggle<CR>
let g:gitgutter_enabled = 1

" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Nerd tree size
let g:NERDTreeWinSize=40

" Lose Bad Habits
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove newbie crutches in Command Mode
"cnoremap <Down> <Nop>
"cnoremap <Left> <Nop>
"cnoremap <Right> <Nop>
"cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Jump to start and end of line using the home row keys
map H ^
map L $

" This makes Y act as D and C, thus copying(Y), deleting(D) and changing(C) from the 
" cursor to the end of the line.
nnoremap Y y$

" Copy paste from PRIMARY and CLIPBOARD
noremap <Leader>C "*y
noremap <Leader>P "*p
noremap <Leader>c "+y
noremap <Leader>p "+p

" Vim Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'erb=eruby',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'go',
\]
let g:vim_markdown_conceal = 2

" Quick Save
nmap <Leader><Leader> :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :x<CR>

" Black
nnoremap == :Black<CR>

" Execute python module in vim
nnoremap <Leader>py :!python %<CR>

" Run executable
iabbrev ppdb import pdb; pdb.set_trace()<ESC>

" fzf stuff
"set rtp+=/usr/local/opt/fzf     " load fzf plugin
nmap <Leader>e :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>' :Commits<CR>
nmap <Leader>h :History<CR>
nmap <Leader>; :History:<CR>
nmap <Leader>/ :History/<CR>

"" Fix latex syntax highlight
"augroup latexfix 
  "" Remove all vimrc autocommands within scope
  "autocmd! 
  "autocmd BufNewFile,BufRead *.tex   set syntax=context
  "autocmd BufNewFile,BufRead *.cls   set syntax=context
"augroup END

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc config, mostly copied from https://github.com/neoclide/coc.nvim#example-vim-configuration

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Coc Explorer config
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'floatingBuffers': {
\     'position': 'floating',
\     'floating-width': 50,
\     'floating-hight': 10,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\ }

" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
