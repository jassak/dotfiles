return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_fallback = false,
      -- },

      formatters_by_ft = {
        lua = { "my_lua_format" },
        python = { "my_black" },
        json = { "my_jq" },
      },

      formatters = {
        my_lua_format = {
          command = "lua-format",
          args = {
            "--indent-width", "4",
            "-i",
            "--no-use-tab",
            "--column-limit", "120",
          },
          stdin = true,
        },

        my_black = {
          command = "black",
          args = { "--line-length", "120", "-" },
          stdin = true,
        },

        my_jq = {
          command = "jq",
          args = { ".", "--indent", "4" },
          stdin = true,
        },
      },
    },

    config = function(_, opts)
      require("conform").setup(opts)

      vim.keymap.set("n", "<leader>cf", function()
        require("conform").format({ async = true })
      end, { desc = "Format buffer" })
    end,
  },
}
