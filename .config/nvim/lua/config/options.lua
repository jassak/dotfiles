-- lua/config/options.lua

local opt = vim.opt
local home = vim.loop.os_homedir()

-- General
opt.inccommand = ""
opt.redrawtime = 300
opt.mouse = "a"
opt.breakindent = true
opt.cursorline = true
opt.completeopt = { "menuone", "noselect" }
opt.cmdheight = 1
opt.history = 10000
opt.showmode = false
opt.showcmd = true
opt.showmatch = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.updatetime = 100
opt.timeoutlen = 500
opt.wildmenu = true
opt.wrap = false
opt.termguicolors = true
opt.laststatus = 3

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Windows
opt.splitbelow = true
opt.splitright = true

-- Numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Buffers / files
opt.backup = true
opt.backupdir = home .. "/.vimtmp"
opt.swapfile = true
opt.directory = home .. "/.vimtmp"
opt.undofile = true
opt.undodir = home .. "/.vimdid"
opt.undolevels = 10000

-- Local config / security
opt.exrc = true
opt.modeline = false

-- Display
opt.conceallevel = 2
opt.listchars = {
  tab = "│·",
  extends = "⟩",
  precedes = "⟨",
  trail = "·",
}
opt.list = true

-- Folds
opt.foldenable = true
opt.foldlevelstart = 99
opt.foldcolumn = "0"
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.fillchars = {
  fold = " ",
}

-- Tabline
vim.opt.showtabline = 2
vim.opt.tabline = "%!v:lua.require'config.tabline'.render()"

-- Greek to Latin key mapping
opt.langmap =
  "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,ΡR,ΣS,ΤT,ΘU,ΩV,ΣW,ΧX,ΥY,ΖZ," ..
  "αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

-- Create persistent state dirs if missing
local state_dirs = {
  opt.backupdir:get()[1],
  opt.directory:get()[1],
  opt.undodir:get()[1],
}

for _, dir in ipairs(state_dirs) do
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end
end
