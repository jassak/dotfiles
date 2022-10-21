vim.g.did_load_filetypes = false
-- setup packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').init({max_jobs = 5})
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager

    -- LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use {"ray-x/lsp_signature.nvim"}
    use 'j-hui/fidget.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'
    use {'m-demare/hlargs.nvim', requires = {'nvim-treesitter/nvim-treesitter'}}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    -- use 'ziontee113/syntax-tree-surfer'

    -- File explorer
    use 'justinmk/vim-dirvish'
    use 'kristijanhusak/vim-dirvish-git'
    use 'roginfarrer/vim-dirvish-dovish'

    -- TPope
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    use 'tpope/vim-surround' -- Surround stuff
    use 'tpope/vim-repeat' -- Better repeat last command
    use 'tpope/vim-unimpaired' -- Pairs of bracket mappings
    use 'tpope/vim-rsi' -- Readline/Emacs keybinding on insert mode
    use 'tpope/vim-eunuch' -- Helpers for UNIX

    -- Telescope
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    use {"LinArcX/telescope-env.nvim", config = function() require"telescope".load_extension("env") end}
    use {
        'notjedi/nvim-rooter.lua', -- required so that telescope find_files knows the project root
        config = function() require'nvim-rooter'.setup() end
    }

    -- fzf
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- UI
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}} -- Status line in lua
    use 'folke/tokyonight.nvim'
    use 'mhinz/vim-startify'

    -- Git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- use 'sindrets/diffview.nvim'
    use 'rhysd/git-messenger.vim'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-calc'
    use 'f3fora/cmp-spell'

    -- Snippets
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use "rafamadriz/friendly-snippets"

    -- Programming Languages
    use 'euclidianAce/BetterLua.vim'
    use 'chrisbra/csv.vim'
    use 'aklt/plantuml-syntax'

    -- Various
    use 'szw/vim-maximizer' -- Maximize current window
    use {"folke/which-key.nvim", config = function() require("which-key").setup {triggers = "auto"} end}
    use 'windwp/nvim-autopairs'
    use {"akinsho/nvim-toggleterm.lua"}
    use "vim-test/vim-test"
    use 'ggandor/lightspeed.nvim'
    use 'mhartington/formatter.nvim'
    use 'jpalardy/vim-slime'
    use 'ledger/vim-ledger'
    use 'wellle/targets.vim'
    use 'mbbill/undotree'
    use {'mg979/vim-visual-multi', branch = "master"}
    -- use 'dhruvasagar/vim-table-mode'
    -- use 'anuvyklack/pretty-fold.nvim'
    use 'rizzatti/dash.vim'
    -- use 'davidgranstrom/nvim-markdown-preview'
    use {'kkoomen/vim-doge', run = ':call doge#install()'}
    use 'scrooloose/vim-slumlord'
end)

require('settings')
require('tabline')
require('functions')
require('keymaps')
require('abbrevs')

-- LSP
require('pluggins.nvim_lsp')
require('pluggins.lsp_signature')
require"fidget".setup {}

-- TS
require('pluggins.nvim_treesitter')
require('pluggins.hlargs')

-- UI
require('pluggins.lualine')
require('pluggins.startify')

-- git
require('pluggins.gitsigns')
-- require('pluggins.diffview')

-- completion
require('pluggins.completion')

-- snippets
require('pluggins.vsnip')

-- telescope
require('pluggins.telescope')

-- fzf
require("pluggins.fzf")

-- terminal
require('pluggins.toggleterm')

-- tests
require('pluggins.vim_test')

require('pluggins.nvim_autopairs')
require('pluggins.vim_slime')
require('pluggins.maximizer')
require('pluggins.undotree')
require('pluggins.ledger')
require('pluggins.dash')
require('pluggins.formatter')
require('pluggins.doge')

require('autocommands')
require('ui')
