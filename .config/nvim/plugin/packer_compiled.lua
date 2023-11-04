-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jasonsakellariou/.cache/nvim/packer_hererocks/2.1.1696795921/share/lua/5.1/?.lua;/Users/jasonsakellariou/.cache/nvim/packer_hererocks/2.1.1696795921/share/lua/5.1/?/init.lua;/Users/jasonsakellariou/.cache/nvim/packer_hererocks/2.1.1696795921/lib/luarocks/rocks-5.1/?.lua;/Users/jasonsakellariou/.cache/nvim/packer_hererocks/2.1.1696795921/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jasonsakellariou/.cache/nvim/packer_hererocks/2.1.1696795921/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/BetterLua.vim",
    url = "https://github.com/euclidianAce/BetterLua.vim"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["dash.vim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/dash.vim",
    url = "https://github.com/rizzatti/dash.vim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-rooter.lua"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16nvim-rooter\frequire\0" },
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-rooter.lua",
    url = "https://github.com/notjedi/nvim-rooter.lua"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  playground = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  tabular = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-env.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\benv\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/telescope-env.nvim",
    url = "https://github.com/LinArcX/telescope-env.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-ledger"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-ledger",
    url = "https://github.com/ledger/vim-ledger"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-rsi",
    url = "https://github.com/tpope/vim-rsi"
  },
  ["vim-slime"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-slime",
    url = "https://github.com/jpalardy/vim-slime"
  },
  ["vim-slumlord"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-slumlord",
    url = "https://github.com/scrooloose/vim-slumlord"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rtriggers\tauto\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/jasonsakellariou/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rtriggers\tauto\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-rooter.lua
time([[Config for nvim-rooter.lua]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16nvim-rooter\frequire\0", "config", "nvim-rooter.lua")
time([[Config for nvim-rooter.lua]], false)
-- Config for: telescope-env.nvim
time([[Config for telescope-env.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\benv\19load_extension\14telescope\frequire\0", "config", "telescope-env.nvim")
time([[Config for telescope-env.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
