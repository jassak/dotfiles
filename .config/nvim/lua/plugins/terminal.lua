return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Horizontal terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating terminal" },
  },
  opts = {
    size = 15,
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    persist_mode = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local map = vim.keymap.set

    map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    map("t", "<C-\\>", [[<C-\><C-n><cmd>ToggleTerm<cr>]], { desc = "Toggle terminal" })

    map("t", "<M-h>", [[<C-\><C-n><C-w>h]], { silent = true, desc = "Window left" })
    map("t", "<M-j>", [[<C-\><C-n><C-w>j]], { silent = true, desc = "Window down" })
    map("t", "<M-k>", [[<C-\><C-n><C-w>k]], { silent = true, desc = "Window up" })
    map("t", "<M-l>", [[<C-\><C-n><C-w>l]], { silent = true, desc = "Window right" })
  end,
}
