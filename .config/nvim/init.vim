language en_US.UTF-8

let g:python3_host_prog = '/Users/zazon/.virtualenvs/py3nvim/bin/python'
let g:python_host_prog = '/Users/zazon/.virtualenvs/py2nvim/bin/python'

" {{{1 Settings
filetype indent plugin on            " load filetype-specific indent and plugin files
syntax enable                        " enable syntax processing
set exrc                             " allows running local rc files
set secure                           " dissalows unsecure commands in local files
set nomodeline                       " disables scanning for ex: vi: vim:
set conceallevel=2                   " prettifies markdown
set cmdheight=2                      " Give more space for displaying messages
set cursorline                       " highlight current line
set history=1000		             " keep 500 lines of command line history
set formatoptions-=cro               " disable automatic comment leader insertion
set foldenable                       " enable folding
set foldlevelstart=0                 " most folds closed by default
set foldmethod=marker                " folds defined manually
set foldcolumn=0                     " show folds on signcolumn
set hidden                           " allows hidden buffers
set ignorecase                       " ignore case in searches by default
set incsearch                        " search as characters are entered
set smartcase                        " but make it case sensitive if an uppercase is entered
set nohlsearch                       " no highlight search (check https://github.com/haya14busa/incsearch.vim)
set laststatus=2                     " show the status line at the bottom
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,trail:•,nbsp:⎵
set noerrorbells visualbell t_vb=    " disable annoying error noises
set noshowmode                       " don't need since we have statusline
set number                           " show line numbers
set relativenumber                   " relative line numbers by default
set scrolloff=8                      " keep action in middle of screen
set shortmess+=c                     " don't pass messages to |ins-completion-menu|.
set showcmd                          " show command in bottom bar
set showmatch                        " highlight matching [{()}]
set signcolumn=yes                   " always draw sign column
set splitbelow                       " open new vertical split bottom
set splitright                       " open new horizontal splits right
set tabstop=4 shiftwidth=4 expandtab " 4 spaces instead of tabs
set ttyfast                          " optimize for fast terminal connections
set timeoutlen=1000                  " short waiting time for comined key maps
set noswapfile
set nobackup
set undodir=~/.vimdid                " permanent undo
set undofile
set undolevels=2000                  " huge undo because why not
set updatetime=100
set wildmenu                         " visual autocomplete for command menu
set nowrap
set completeopt=menuone,noinsert     " Do not insert any text for a match until the user selects a match
set t_ZH=[3m                       " correctly render italics
set t_ZR=[23m                      " correctly render italics

set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz
" }}}1

" {{{1 Keymaps
noremap Q gq
inoremap <Up> <C-K>
inoremap <Down> <C-J>
inoremap <Left> <BS>
inoremap <Right> <Nop>
nnoremap <Up> gUiww
nnoremap <Down> guiww
nnoremap <Left> :bp<CR>
nnoremap <right> :bn<CR>
nnoremap <Silent> # #zz
nnoremap <Silent> * *zz
nnoremap <Silent> N Nzz
nnoremap <Silent> g* g*zz
nnoremap <Silent> n nzz
nnoremap <Silent> J mzJ`z
nnoremap <Silent> ]] ]]zz
nnoremap <Silent> [[ [[zz
nnoremap <Silent> [] []zz
nnoremap <Silent> ][ ][zz
nnoremap <Silent> ]m ]mzz
nnoremap <Silent> [m [mzz
nnoremap <Silent> ]M ]Mzz
nnoremap <Silent> [M [Mzz
" Move text
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
vnoremap <c-h> <gv
vnoremap <c-l> >gv
inoremap <c-j> <esc>:m .+1<CR>==li
inoremap <c-k> <esc>:m .-2<CR>==li
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
nnoremap <c-h> <<
nnoremap <c-l> >>

" nnoremap <CR> @@
nnoremap <BS> <C-^>
nnoremap H ^
nnoremap L $
nnoremap Y y$
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
xnoremap <F5> y:Dash <C-r>"<CR>
nnoremap <F5> :Dash<CR>
nnoremap \\ :nohlsearch<CR>
nnoremap tt :tabnext<cr>
nnoremap TT :tabprevious<cr>

nnoremap ∂ yyp
xnoremap ∂ yg`]p
" paste in visual mode
vnoremap p "_dP

tnoremap Ω <C-\><C-n>
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
tnoremap ç <C-\><C-N>:close<CR>
nnoremap ç :close<CR>
tnoremap œ <C-\><C-n>:bd!<CR>
nnoremap œ <C-\><C-n>:bd<CR>
tnoremap <silent>∑ <C-\><C-n>:CocCommand terminal.Toggle<CR>

" Go to definition in other vertical window
" https://stackoverflow.com/questions/33600608/how-to-cause-ctags-to-show-tag-definition-on-vertical-split-without-opening-a-ne/33603586#answer-33603586
nnoremap <c-]> <c-]>zz
nnoremap <c-w><c-]> :only<bar>vsplit<CR>:execute "tag " . expand('<cword>')<CR>
nnoremap <c-p><c-]> :only<bar>vsplit<CR>:execute "tag " . expand('<cword>')<CR><c-w>w

" {{{2 leader keymaps
let mapleader=" "       " leader is space
nnoremap <leader>/ :History/<CR>
nnoremap <leader>; :History:<CR>
nnoremap <leader><Leader> za
nnoremap <Leader>a :Ag<CR>
xnoremap <leader>a y`>:Ag "<Cr>
nnoremap <Leader>b :Buffers<CR>
nnoremap <leader>c :cw<CR>
nnoremap <leader>d :BD<CR>
nnoremap <leader>e :GFiles<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>gg :Commits<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>r :CocCommand terminal.REPL<CR>
" nnoremap <leader>rc :source ~/.vimrc<CR>
nnoremap <leader>us :UltiSnipsEdit<CR>
nnoremap <leader>ut :UndotreeToggle<CR>
nnoremap <leader>~ :FZF ~<CR>
nnoremap <leader>§ :call ToggleSpellcheck()<CR>
nnoremap <leader>1 :set spelllang=en<cr>
nnoremap <leader>2 :set spelllang=el<cr>
nnoremap <leader>3 :set spelllang=fr<cr>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
" nnoremap <silent><leader>t :split term://zsh<CR>i
nnoremap <silent><leader>t :CocCommand terminal.Toggle<CR>
nmap <silent><leader>vt :vsplit term://zsh<CR>i
noremap <leader>P "+P
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>y "+y
noremap <silent><leader>z :Goyo<CR>
xnoremap <Leader><leader> zf
xnoremap <leader>= y`>a = ="<Cr><ESC>

" {{{3 Vimspector
" " General
" nnoremap <leader>dd :call vimspector#Launch()<CR>
" nnoremap <leader>dq :call vimspector#Reset()<CR>
" nmap <leader>d<BS> <Plug>VimspectorRestart
" " Motions
" nmap <leader>d<space> <Plug>VimspectorStepOver
" nmap <leader>di <Plug>VimspectorStepIn
" nmap <leader>do <Plug>VimspectorStepOut
" nmap <leader>drc <Plug>VimspectorRunToCursor
" nnoremap <leader>dc :call vimspector#Continue()<CR>
" " Breakpoints
" nmap <leader>db <Plug>VimspectorToggleBreakpoint
" nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint
" nmap <leader>dxb :call vimspector#ClearBreakpoints()<CR>
" " Eval
" nnoremap <leader>de :VimspectorEval<space>
" nnoremap <leader>dw :VimspectorWatch<space>
" }}}

function! ToggleSpellcheck()
    if(&spell == 1)
        set nospell
    else
        set spell
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
" }}}

" mip algos stdout
" tnoremap ø import sys; sys.stdout = sys.__stdout__
iabbrev pdb __import__('pdb').set_trace()
iabbrev improt import
iabbrev imoprt import
iabbrev arrau array
" }}}1

" {{{1 Plugins Install

call plug#begin()

Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'jassak/vim-snippets'
Plug 'jez/vim-better-sml'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lark-parser/vim-lark-syntax'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'neovimhaskell/haskell-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'preservim/tagbar'
Plug 'puremourning/vimspector'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'rizzatti/dash.vim'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'prendradjaja/vim-vertigo'
Plug 'vim-ruby/vim-ruby'
Plug 'vimwiki/vimwiki'
Plug 'wlangstroth/vim-racket'
Plug 'jpalardy/vim-slime'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'mileszs/ack.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

" }}}1

" {{{1 Plugin Config

" {{{2 vim-gutter
set updatetime=100
let g:gitgutter_enabled = 1

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" }}}2

" {{{2 vim-rooter
let g:rooter_patterns = ['.git', 'Makefile']
" }}}2

" {{{2 fzf
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-d': 'bd' }
let g:fzf_layout = { 'down': '40%' }

"FZF Buffer Delete
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
" }}}

" {{{2 lightline
let g:lightline = {
      \ 'colorscheme': '16color',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'tagbar' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" }}}

" {{{2 haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:cabal_indent_section = 2
" }}}

" {{{2 semshi
let g:semshi#excluded_hl_groups = ['local', 'unresolved']
let g:semshi#always_update_all_highlights = v:true
" }}}

" {{{2 startify
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = ['']
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'z': '~/.zshrc'}, {'t': '~/.tmux.conf'} ]
" }}}

" {{{2 nerdcommenter
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
" }}}

" {{{2 base16-vim
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark
" }}}

" {{{2 undotree
let g:undotree_SplitWidth=35
let g:undotree_WindowLayout=2
" }}}

" {{{2 Ultisnipps
let g:UltiSnipsExpandTrigger="§"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snips"]
let g:ultisnips_python_style="numpy"
" }}}

" {{{2 vim-markdown
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
" }}}

" {{{2 tagbar
let g:tagbar_position = 'leftabove vertical'
let g:tagbar_width = max([25, winwidth(0) * 2 / 9])
nmap <silent> <F12> :TagbarToggle<CR>
" }}}

" {{{2 goyo
let g:goyo_width=90
let g:goyo_height=110
" }}}

" {{{2 vimspector

" }}}

" {{{2 coc.nvim
let g:coc_global_extensions = ['coc-explorer', 'coc-snippets', 'coc-pyright',
            \   'coc-json', 'coc-prettier', 'coc-diagnostic', 'coc-sql',
            \   'coc-vimlsp', 'coc-html', 'coc-marketplace', 'coc-terminal',
            \   'coc-lua']

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

" " Use <F3> to trigger completion.
inoremap <silent><expr> <F3> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> \a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> \e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> \c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> \o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> \s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> \j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> \k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> \p  :<C-u>CocListResume<CR>


" {{{3 explorer

let g:explorer_width = max([25, winwidth(0) * 2 / 9])
execute 'nmap <silent> <F10> :CocCommand explorer --width ' . g:explorer_width . ' --position left --sources buffer-,file+<CR>'
" nnoremap <Leader>b :CocCommand explorer --preset floatingBuffers --sources buffer+<CR>
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.config/nvim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
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
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\ }
" }}}

" {{{3 snippets

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <leader>x for convert visual selected code to snippet
xmap <leader>s  <Plug>(coc-convert-snippet)

" }}}

" }}}

" {{{2 vimwiki
let g:vimwiki_map_prefix = ',w'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/vimwiki_html/'}]
" }}}

" {{{2 vim-vertigo
nnoremap <silent> <Space>j :<C-U>VertigoDown n<CR>
vnoremap <silent> <Space>j :<C-U>VertigoDown v<CR>
onoremap <silent> <Space>j :<C-U>VertigoDown o<CR>
nnoremap <silent> <Space>k :<C-U>VertigoUp n<CR>
vnoremap <silent> <Space>k :<C-U>VertigoUp v<CR>
onoremap <silent> <Space>k :<C-U>VertigoUp o<CR>
" }}}

" {{{2 vim-slime
let g:slime_target = "neovim"
" }}}

" {{{2 vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
" }}}

" {{{2 vim-gutentags
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
" }}}

" {{{2 ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" {{{2 pymode
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 0
let g:pymode_options_max_line_length = 88
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_run = 1
let g:pymode_run_bind = '<localleader>a'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<localleader>b'
let g:pymode_lint_on_write = 0
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
let g:pymode_lint_cwindow = 1
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_syntax = 0
" }}}
" }}}

" {{{1 Autocommands
let maplocalleader=','
" vim jumps to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

function! PasteCommentBox()
    normal Oji# 56a-A #
    normal yyp
    normal O# 56a A #^lllR
endfunction

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
endfunction

function! s:goyo_leave()
  " doautocmd Syntax
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! PythonFilenameToModule()
    let l:fname = expand("%")
    let l:tmp = substitute(l:fname, "/", ".", "g")
    return substitute(l:tmp, ".py$", "", "")
endfunction


" {{{2 Python
augroup filetype_py
    autocmd!
    autocmd FileType python set colorcolumn=89
    autocmd FileType python nnoremap <leader><Leader> zA
    autocmd FileType python nnoremap <buffer> <LocalLeader>r :w<CR>:execute "split term://python -m " . PythonFilenameToModule()<CR>
    autocmd FileType python xnoremap <buffer> <LocalLeader>r :w<CR>:'<,'>CocAction refactor<CR>
    autocmd FileType python nnoremap <buffer> <LocalLeader>d :w<CR>:execute "split term://python -m pdb -m " . PythonFilenameToModule()<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>p :w<CR>:split term://python -m cProfile --sort=cumtime %<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>i :w<CR>:execute "split term://ipython -i -m " .PythonFilenameToModule()<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>s :w<CR>:execute "split term://python -i -m " . PythonFilenameToModule()<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>ta :w<CR>:split term://pytest %<CR>i
    autocmd FileType python xnoremap <buffer> <LocalLeader>tt y:w<CR>:split term://pytest -v %::"<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>td :w<CR>:split term://pytest --lf --pdb %<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>tx :w<CR>:split term://pytest -x %<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>tt :w<CR>:split term://pytest --lf %<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>tv :w<CR>:split term://pytest --lf -vvv %<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>tr :w<CR>:split term://pytest --lf --trace %<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>tc :w<CR>:split term://coverage run --source=. -m pytest % && coverage html<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>vr :w<CR>:execute "vsplit term://python -m " . PythonFilenameToModule()<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>vd :w<CR>:execute "vsplit term://python -m pdb -m " . PythonFilenameToModule()<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>vp :w<CR>:vsplit term://python -m cProfile --sort=cumtime %<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>vi :w<CR>:execute "vsplit term://ipython -i -m " . PythonFilenameToModule()<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>vs :w<CR>:execute "vsplit term://python -i -m " . PythonFilenameToModule()<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>nd :w<CR>:execute "tabnew term://python -m pdb -m " . PythonFilenameToModule()<CR>i
    autocmd FileType python nnoremap <buffer> <LocalLeader>ni :w<CR>:execute "tabnew term://ipython -i -m " . PythonFilenameToModule()<CR>i
    " autocmd FileType python nnoremap <buffer> <LocalLeader>c :call PasteCommentBox()<CR>
    autocmd FileType python nnoremap <buffer> <LocalLeader>cdb Ofrom celery.contrib import rdb; rdb.set_trace()<Esc>
    autocmd FileType python nnoremap <buffer> <LocalLeader>f :Format<CR>
    autocmd FileType python nnoremap <buffer> <LocalLeader>m :CocCommand pyright.organizeimports<CR>
    autocmd FileType python set foldmethod=indent
    autocmd FileType python set foldlevelstart=99
    autocmd FileType python set foldlevel=99
augroup END
" }}}

" {{{2 SML
augroup vimbettersml
    au!
    " ----- Keybindings -----
    au FileType sml nnoremap <silent> <buffer> <localleader>t :SMLTypeQuery<CR>
    au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>
    " open the REPL terminal buffer
    au FileType sml nnoremap <silent> <buffer> <localleader>s :SMLReplStart<CR>
    " close the REPL (mnemonic: k -> kill)
    au FileType sml nnoremap <silent> <buffer> <localleader>k :SMLReplStop<CR>
    " build the project (using CM if possible)
    au FileType sml nnoremap <silent> <buffer> <localleader>b :SMLReplBuild<CR>
    " for opening a structure, not a file
    au FileType sml nnoremap <silent> <buffer> <localleader>o :SMLReplOpen<CR>
    " use the current file into the REPL (even if using CM)
    au FileType sml nnoremap <silent> <buffer> <localleader>u :SMLReplUse<CR>
    " clear the REPL screen
    au FileType sml nnoremap <silent> <buffer> <localleader>c :SMLReplClear<CR>
    " set the print depth to 100
    au FileType sml nnoremap <silent> <buffer> <localleader>p :SMLReplPrintDepth<CR>

    " ----- Other settings -----
    " Uncomment to try out conceal characters
    au FileType sml setlocal conceallevel=2
    " Uncomment to try out same-width conceal characters
    " let g:sml_greek_tyvar_show_tick = 1
    " 4 spaces instead of tabs
    au FileType sml setlocal tabstop=4 shiftwidth=4 expandtab
augroup END
" }}}

" {{{2 Racket
function! RacketRepl()
  execute ":split term://racket"
    try
        let a_save = @a
        let @a = "(enter! \"" . bufname("#") . "\")"
        sleep 100m
        normal! "ap
    finally
        let @a = a_save
    endtry
endfunction

augroup filetype_racket
    autocmd!
    autocmd BufNewFile,BufRead *.rkt nnoremap <buffer> <localleader>r :call RacketRepl()<CR>a<CR>
augroup END
" }}}

" {{{2 Scheme
function! SchemeRepl()
  execute ":split term://scheme"
    try
        let a_save = @a
        let @a = "(load \"" . bufname("#") . "\")"
        sleep 100m
        normal! "ap
    finally
        let @a = a_save
    endtry
endfunction

augroup filetype_scheme
    autocmd!
    autocmd BufNewFile,BufRead *.scm nnoremap <buffer> <localleader>r :call SchemeRepl()<CR>a<CR>
augroup END
" }}}

" {{{2 OCaml
augroup filetype_ocaml
    autocmd!
    autocmd BufNewFile,BufRead *.ml nnoremap <buffer> <localleader>r :split term://utop<CR>i
    " autocmd BufNewFile,BufRead *.ml xnoremap <buffer> <localleader>r y:split term://utop<CR>
augroup END
" }}}

" {{{2 Haskell
augroup filetype_hs
    autocmd!
    autocmd FileType haskell nnoremap <buffer> <LocalLeader>s :w<CR>:12split term://ghci %<CR>i
    autocmd FileType haskell nnoremap <buffer> <LocalLeader>f :%!hindent<CR>
    " autocmd FileType haskell nnoremap <buffer> <LocalLeader>s :w<CR>:CocCommand terminal.Toggle<CR>ghci %<CR>i
augroup END
" }}}

" {{{2 Ruby
augroup filetype_rb
    autocmd!
    " autocmd FileType ruby set colorcolumn=89
    autocmd FileType ruby nnoremap <buffer> <LocalLeader>r :w<CR>:split term://irb -r ./%<CR>i
    autocmd FileType ruby nnoremap <buffer> <LocalLeader>vr :w<CR>:vsplit term://irb -r ./%<CR>i
augroup END
" }}}

" {{{2 Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
" }}}

" {{{2 UML
augroup filetype_uml
    autocmd!
    autocmd BufNewFile,BufRead *.uml,*.pu,*.plantuml,*puml nnoremap <buffer> <LocalLeader>m :w<CR>:silent make<CR>:!open %:r.png<CR>
augroup END
" }}}

" {{{2 Vimwiki
augroup filetype_wiki
    autocmd!
    autocmd FileType *.wiki nnoremap <buffer> <LocalLeader>c :<Plug>VimwikiToggleListItem<CR>
augroup END
" }}}
" }}}

" {{{1 Highlight
highlight Comment cterm=italic
" hi semshiParameter ctermfg=75  guifg=#5fafff cterm=italic gui=italic
" hi semshiFree      ctermfg=218 guifg=#ffafd7 cterm=italic gui=italic
" hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline,italic gui=underline
" }}}
