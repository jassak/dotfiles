local map = vim.keymap.set

map("n", "<localleader>a", "<cmd>Ledger bal Assets<cr>", { buffer = true, desc = "Ledger assets" })
map("n", "<localleader>u", "<cmd>Register Unknown<cr>", { buffer = true, desc = "Ledger unknown" })
map("n", "<localleader>l", "<cmd>Ledger<cr>", { buffer = true, desc = "Ledger" })
map("n", "<localleader>r", "<cmd>Register<cr>", { buffer = true, desc = "Register" })
map("n", "<localleader>b", "<cmd>Ledger bal<cr>", { buffer = true, desc = "Ledger balance" })
map("x", "<Tab>", "<cmd>LedgerAlign<cr>", { buffer = true, silent = true, desc = "Align ledger" })
map("n", "<C-c><C-c>", "<cmd>call ledger#entry()<cr>", { buffer = true, desc = "Complete entry" })
