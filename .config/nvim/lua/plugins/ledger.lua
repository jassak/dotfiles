return {
  {
    "ledger/vim-ledger",
    ft = { "ledger", "hledger", "journal" },
    init = function()
      -- path to ledger executable
      vim.g.ledger_bin = "ledger"

      -- open report windows on the right
      vim.g.ledger_winpos = "r"
    end,
  },
}
