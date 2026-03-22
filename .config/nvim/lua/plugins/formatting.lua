return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
      },

      formatters_by_ft = {
        python = { "ruff_format" },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)

      -- manual format key
      vim.keymap.set("n", "<leader>cf", function()
        require("conform").format({ async = true })
      end, { desc = "Format buffer" })
    end,
  },
}
