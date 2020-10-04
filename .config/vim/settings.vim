filetype indent plugin on            " load filetype-specific indent and plugin files
syntax enable                        " enable syntax processing
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set writebackup
set conceallevel=2                   " prettifies markdown 
set cmdheight=2                      " Give more space for displaying messages
set cursorline                       " highlight current line
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set history=500		                 " keep 500 lines of command line history
set foldenable                       " enable folding
set foldlevelstart=2                 " most folds closed by default
set foldmethod=indent                " fold based on indent level
set foldnestmax=10                   " 10 nested fold max
set hidden                           " allows hidden buffers
set ignorecase                       " ignore case in searches by default
set incsearch                        " search as characters are entered
set laststatus=2                     " show the status line at the bottom
" set lazyredraw                       " redraw only when we need to.
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,trail:•,nbsp:⎵
set noerrorbells visualbell t_vb=    " disable annoying error noises
set noshowmode                       " don't need since we have statusline
set mouse=
set number                           " show line numbers
set relativenumber                   " relative line numbers by default
set scrolloff=12                     " keep action in middle of screen
set shortmess+=c                     " don't pass messages to |ins-completion-menu|.
set showcmd                          " show command in bottom bar
set showmatch                        " highlight matching [{()}]
set signcolumn=yes                   " always draw sign column
set smartcase                        " but make it case sensitive if an uppercase is entered
set splitbelow                       " open new vertical split bottom
set splitright                       " open new horizontal splits right
set tabstop=4 shiftwidth=4 expandtab " 4 spaces instead of tabs
set ttyfast                          " optimize for fast terminal connections
set undodir=~/.vimdid                " permanent undo
set undofile
set undolevels=2000                  " huge undo because why not
set updatetime=100
set wildmenu                         " visual autocomplete for command menu

set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

