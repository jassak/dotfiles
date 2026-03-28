return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
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

    },

    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
