local map = vim.keymap.set

local opts = { silent = true }
local expr_opts = { expr = true, silent = true }

-- Clear Space in normal/visual/operator-pending modes
map({ "n", "v", "o" }, "<Space>", "<Nop>", { silent = true, desc = "Leader prefix" })

-- Better movement with wrapped lines
map("n", "j", [[v:count == 0 ? "gj" : "j"]], expr_opts)
map("n", "k", [[v:count == 0 ? "gk" : "k"]], expr_opts)

-- Y behaves like D/C: from cursor to end of line
map("n", "Y", "y$", opts)

-- Clipboard
map({ "n", "v" }, "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+y$', opts)
map("n", "<leader>p", '"+p', opts)
map("n", "<leader>P", '"+P', opts)
map("v", "<leader>p", '"+p', opts)
map("v", "<leader>P", '"+P', opts)

-- Save / quit
map("n", "<M-w>", "<cmd>w<cr>", opts)
map("n", "<M-q>", "<cmd>q<cr>", opts)
map("n", "<M-x>", "<cmd>x<cr>", opts)
map("t", "<M-q>", "<cmd>bd!<cr>", opts)

-- Window navigation
map("n", "<M-h>", "<C-w>h", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-k>", "<C-w>k", opts)
map("n", "<M-l>", "<C-w>l", opts)

-- Window movement
map("n", "<M-H>", "<C-w>H", opts)
map("n", "<M-J>", "<C-w>J", opts)
map("n", "<M-K>", "<C-w>K", opts)
map("n", "<M-L>", "<C-w>L", opts)

-- Tab navigation
map("n", "<M-n>", "gt", opts)
map("n", "<M-p>", "gT", opts)

-- Q formats text instead of entering Ex mode
-- map("n", "Q", "gq", opts)

-- Search results stay centered
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)

-- Join lines without moving cursor
map("n", "J", "mzJ`z", opts)

-- Move selected text
map("x", "<C-j>", ":m '>+1<cr>gv=gv", opts)
map("x", "<C-k>", ":m '<-2<cr>gv=gv", opts)
map("x", "<C-h>", "<gv", opts)
map("x", "<C-l>", ">gv", opts)

-- Move current line
map("n", "<C-j>", ":m .+1<cr>==", opts)
map("n", "<C-k>", ":m .-2<cr>==", opts)
map("n", "<C-h>", "<<", opts)
map("n", "<C-l>", ">>", opts)

-- Move current line from insert mode
map("i", "<C-j>", "<esc>:m .+1<cr>==gi", opts)
map("i", "<C-k>", "<esc>:m .-2<cr>==gi", opts)

-- Duplicate line / selection
map("n", "<M-d>", "yyp", opts)
map("x", "<M-d>", "yg`>p", opts)

-- Visual paste without overwriting unnamed register
map("x", "p", [["_dP]], opts)

-- Terminal window navigation
map("t", "<M-h>", [[<C-\><C-n><C-w>h]], opts)
map("t", "<M-j>", [[<C-\><C-n><C-w>j]], opts)
map("t", "<M-k>", [[<C-\><C-n><C-w>k]], opts)
map("t", "<M-l>", [[<C-\><C-n><C-w>l]], opts)

-- Exit terminal mode
map("t", "<C-q>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("t", "<C-\\>", [[<C-\><C-n><cmd>ToggleTerm<cr>]])

-- First press goes to first non-blank, second goes to column 1
map("n", "0", function()
  local col = vim.fn.col(".")
  local first_nonblank = vim.fn.match(vim.fn.getline("."), [[\S]]) + 1
  if col == first_nonblank then
    return "0"
  else
    return "^"
  end
end, { expr = true, silent = true, desc = "Smart line start" })

-- Toggle light/dark background
map("n", "<leader>ob", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
  print("background → " .. vim.o.background)
end, { desc = "Toggle light/dark background" })
