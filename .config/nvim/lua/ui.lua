-- colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.g.tokyonight_style = "night"
vim.cmd [[colorscheme tokyonight]]
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

-- Highlights
vim.cmd[[
hi NvimTreeGitDirty guifg=#f7768e
hi NvimTreeGitNew guifg=#e0af68
hi Directory ctermfg=159 guifg=#7aa2f7 gui=italic
hi Keyword gui=italic cterm=italic
hi TSKeyword gui=italic cterm=italic guifg=#9d7cd8
hi TSKeywordFunction guifg=#bb9af7 cterm=italic gui=italic
]]
