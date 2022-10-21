-- General settings
vim.g.python3_host_prog = '/Users/zazon/.virtualenvs/py3nvim/bin/python'
vim.g.python_host_prog = '/Users/zazon/.virtualenvs/py2nvim/bin/python'
vim.o.inccommand = 'split' -- Incremental live completion
vim.o.redrawtime = 300
vim.o.hlsearch = false -- Set highlight on search
vim.wo.number = true -- Make line numbers default
vim.o.hidden = true -- Do not save when switching buffers
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.breakindent = true -- Enable break indent
-- vim.o.autoindent = true -- copy indent from current line when starting a new line
vim.o.ignorecase = true -- Case insensitive searching ...
vim.o.smartcase = true -- ...unless /C or capital in search
vim.o.splitbelow = true -- Sane splits
vim.o.splitright = true -- Sane splits
vim.o.cursorline = true
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.exrc = true -- allows running local rc files
vim.o.secure = true -- dissalows unsecure commands in local files
vim.o.modeline = false -- disables scanning for ex: vi: vim:
vim.o.conceallevel = 2 -- prettifies markdown
vim.o.cmdheight = 1 -- Give more space for displaying messages
vim.o.history = 10000 -- keep 10000 lines of command line history
--vim.o.formatoptions-=cro -- disable automatic comment leader insertion
vim.o.foldenable = true -- enable folding
vim.o.foldlevelstart = 100 -- most folds closed by default
vim.o.foldmethod = 'marker' -- folds defined manually
vim.o.foldcolumn = '0' -- show folds on signcolumn
vim.o.hidden = true -- allows hidden buffers
vim.o.ignorecase = true -- ignore case in searches by default
vim.o.incsearch = true -- search as characters are entered
vim.o.smartcase = true -- but make it case sensitive if an uppercase is entered
vim.o.hlsearch = false -- no highlight search (check https://github.com/haya14busa/incsearch.vim)
vim.o.laststatus = 3 -- show the status line at the bottom
vim.opt.listchars = { -- does not work for some reason
  tab = '│·',
  extends = '⟩',
  precedes = '⟨',
  trail = '·'
}
vim.o.showmode = false -- don't need since we have statusline
vim.o.number = true -- show line numbers
vim.o.relativenumber = false -- no relative line numbers by default
vim.o.scrolloff = 8 -- keep action in middle of screen
-- vim.o.shortmess+=c -- don't pass messages to |ins-completion-menu|.
vim.o.showcmd = true -- show command in bottom bar
vim.o.showmatch = true -- highlight matching [{()}]
vim.o.signcolumn = 'yes' -- always draw sign column
vim.o.splitbelow = true -- open new vertical split bottom
vim.o.splitright = true -- open new horizontal splits right
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true -- 4 spaces instead of tabs
vim.o.ttyfast = true -- optimize for fast terminal connections
vim.o.timeoutlen = 500 -- short waiting time for comined key maps
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.loop.os_homedir() .. '/.vimdid' -- permanent undo
vim.o.undofile = true
vim.o.undolevels = 10000 -- huge undo because why not
vim.o.updatetime = 100
vim.o.wildmenu = true -- visual autocomplete for command menu
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.langmap = 'ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,ΡR,ΣS,ΤT,ΘU,ΩV,ΣW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz'

-- Behaviour
-- remove trailing whitespaces
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
-- remove trailing newline
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Treesitter folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Nice folds https://www.reddit.com/r/vim/comments/odfbvq/do_you_like_my_minimal_fold_indicators/
vim.cmd([[
function! MyFoldText()
    let line = getline(v:foldstart)
    return line . ' ...'
endfunction
set foldtext=MyFoldText()
]])
vim.o.fillchars = [[fold: ]]
