return {
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "AerialOpen", "AerialToggle" },
    keys = {
      { "<leader>cs", "<cmd>AerialToggle!<cr>", desc = "Symbols outline" },
      { "{", "<cmd>AerialPrev<cr>", desc = "Previous symbol" },
      { "}", "<cmd>AerialNext<cr>", desc = "Next symbol" },
    },
    opts = {
      backends = {
          "treesitter",
          "lsp",
          "markdown",
          "man",
          vimwiki = { "markdown" },
      },
      layout = {
        min_width = 28,
        default_direction = "right",
        placement = "window",
        resize_to_content = true,
      },
      attach_mode = "window",
      close_automatic_events = {},
      show_guides = true,
      highlight_on_hover = true,
      autojump = false,
      nerd_font = true,
      guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.jump",
        ["o"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["p"] = "actions.scroll",
        ["q"] = "actions.close",
        ["z"] = "actions.fold_toggle",
        ["[["] = "actions.prev",
        ["]]"] = "actions.next",
      },
    },
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
    },
  },

  {
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {
        modes = {
          treesitter = {
            labels = "",
            label = {
              before = false,
              after = false,
            },
          },
        },
      },
      keys = {
        {
          "<M-s>",
          mode = { "n", "x", "o" },
          function()
            require("flash").treesitter({
              actions = {
                ["<M-s>"] = "next",
                ["<M-S>"] = "prev",
                [";"] = "next",
                [","] = "prev",
              },
            })
          end,
          desc = "Treesitter incremental selection",
        },
      },
    },
  }
}
