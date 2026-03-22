return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    keys = {
      {
        "<localleader>tt",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
        ft = "python",
      },
      {
        "<localleader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run file tests",
        ft = "python",
      },
      {
        "<localleader>ta",
        function()
          require("neotest").run.run({ suite = true })
        end,
        desc = "Run test suite",
        ft = "python",
      },
      {
        "<localleader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
        ft = "python",
      },
      {
        "<localleader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Test output",
        ft = "python",
      },
      {
        "<localleader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Test summary",
        ft = "python",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            runner = "pytest",
          }),
        },
      })
    end,
  },
}
