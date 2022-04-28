require'nvim-treesitter.configs'.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
          ["L"] = "@parameter.inner",
      },
      swap_previous = {
        ["H"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["}"] = "@function.outer",
        [")"] = "@class.outer",
      },
      goto_next_end = {
        ["g}"] = "@function.outer",
        ["g)"] = "@class.outer",
      },
      goto_previous_start = {
        ["{"] = "@function.outer",
        ["("] = "@class.outer",
      },
      goto_previous_end = {
        ["g{"] = "@function.outer",
        ["g("] = "@class.outer",
      },
    },
  },
}
