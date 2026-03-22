-- lua/config/autocmds.lua

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Trim trailing whitespace on save
autocmd("BufWritePre", {
  group = augroup("TrimTrailingWhitespace", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Remove extra blank lines at end of file on save
autocmd("BufWritePre", {
  group = augroup("TrimTrailingBlankLines", { clear = true }),
  pattern = "*",
  command = [[%s/\n\+\%$//e]],
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Start terminal in insert mode
autocmd("TermOpen", {
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Restore cursor position
autocmd("BufReadPost", {
  group = augroup("RestoreCursorPosition", { clear = true }),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 1 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Make gq use native formatting instead of LSP formatexpr
autocmd("LspAttach", {
  group = augroup("LspFormattingBehavior", { clear = true }),
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})

-- Gnuplot filetype
autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("GnuplotFiletype", { clear = true }),
  pattern = "*.gp",
  callback = function()
    vim.bo.filetype = "gnuplot"
  end,
})

autocmd("FileType", {
  pattern = { "markdown", "python", "lua", "sh", "bash", "json", "toml" },
  callback = function()
    vim.treesitter.start()
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nc"
  end,
})
