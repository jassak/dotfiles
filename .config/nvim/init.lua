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
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager

    -- LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'folke/lsp-colors.nvim'
    use 'onsails/lspkind-nvim'
    use 'glepnir/lspsaga.nvim'
    use {"ahmedkhalf/lsp-rooter.nvim", config = function() require("lsp-rooter").setup {} end}

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'

    -- File explorer
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

    -- TPope
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    use 'tpope/vim-vinegar' -- Better netrw
    use 'tpope/vim-surround' -- Surround stuff
    use 'tpope/vim-repeat' -- Better repeat last command
    use 'tpope/vim-unimpaired' -- Pairs of bracket mappings
    use 'tpope/vim-rsi' -- Readline/Emacs keybinding on insert mode

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require"telescope".load_extension("frecency")
      end,
      requires = {"tami5/sqlite.lua"}
    }

    -- UI
    use {'christianchiarulli/nvcode-color-schemes.vim', config = 'vim.g.nvcode_termcolors = 256'}
    use 'rafi/awesome-vim-colorschemes'
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}} -- Status line in lua
    use 'folke/tokyonight.nvim'
    use 'mhinz/vim-startify'

    -- Git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'} -- Magit clone
    use 'sindrets/diffview.nvim'

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
    use 'Vimjas/vim-python-pep8-indent'

    -- Various
    use 'szw/vim-maximizer' -- Maximize current window
    -- use 'glepnir/dashboard-nvim'
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup {triggers = "auto"} end
    }
    use 'gennaro-tedesco/nvim-jqx'
    use 'windwp/nvim-autopairs'
    use {"akinsho/nvim-toggleterm.lua"}
    use {"rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins"}
    use 'ggandor/lightspeed.nvim'
    use 'mhartington/formatter.nvim'
    use 'jpalardy/vim-slime'
    use 'ledger/vim-ledger'
    use 'wellle/targets.vim'
    use 'tommcdo/vim-lion'
    use 'mbbill/undotree'
    use 'simrat39/symbols-outline.nvim'
    use 'nanotee/zoxide.vim'
end)

require('settings')
require('tabline')
require('functions')
require('keymaps')
require('abbrevs')

require('pluggins.lualine')
require('pluggins.gitsigns')
require('pluggins.telescope')
require('pluggins.nvim_lsp')
require('pluggins.lspsaga')
require('pluggins.lspkind')
require('pluggins.nvim_treesitter')
require('pluggins.nvim_tree')
require('pluggins.toggleterm')
require('pluggins.diffview')
require('pluggins.vim_test')
require('pluggins.formatter')
require('pluggins.nvim_autopairs')
require('pluggins.completion')
require('pluggins.vim_slime')
require('pluggins.startify')
require('pluggins.maximizer')
require('pluggins.vim_commentary')
require('pluggins.neogit')
require('pluggins.diffview')
require('pluggins.vsnip')
require('pluggins.undotree')
require('pluggins.ledger')
require('pluggins.frecency')

require('autocommands')
