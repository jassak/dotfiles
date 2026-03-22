return {
  {
    "echasnovski/mini.nvim",
    event = "BufReadPost",
    config = function()
      -- highlight word under cursor
      require("mini.cursorword").setup({
        delay = 100,
      })
    end,
  },
}
