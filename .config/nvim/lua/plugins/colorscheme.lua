return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      light_style = "day",

      transparent = false,
      terminal_colors = true,

      dim_inactive = false,

      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },

    on_highlights = function(hl, colors)
      local blacker = "#16161e"

      hl.Normal = { bg = blacker }
      hl.NormalNC = { bg = blacker }
      hl.NormalFloat = { bg = blacker }
      hl.SignColumn = { bg = blacker }
      hl.EndOfBuffer = { fg = blacker, bg = blacker }
    end
    },

    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
