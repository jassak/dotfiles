return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "python",
        "markdown",
        "markdown_inline",
        "lua",
        "bash",
        "json",
      },
      sync_install = false,
      auto_install = true,
      install_dir = vim.fn.stdpath("data") .. "/site",
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      -- Highlighting on main is enabled via vim.treesitter.start(),
      -- not via highlight.enable in nvim-treesitter.setup().
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "markdown", "lua", "bash", "json" },
        callback = function(args)
          local max_filesize = 1000 * 1024
          local name = vim.api.nvim_buf_get_name(args.buf)
          local ok, stats = pcall(vim.uv.fs_stat, name)
          if ok and stats and stats.size > max_filesize then
            return
          end
          vim.treesitter.start(args.buf)
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          include_surrounding_whitespace = true,
        },
        swap = {
          enable = true,
        },
      })

      -- select
      local select = require("nvim-treesitter-textobjects.select")
      vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ap", function()
        select.select_textobject("@parameter.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ip", function()
        select.select_textobject("@parameter.inner", "textobjects")
      end)

      -- swap
      local swap = require("nvim-treesitter-textobjects.swap")
      vim.keymap.set("n", "L", function()
        swap.swap_next("@parameter.inner")
      end)
      vim.keymap.set("n", "H", function()
        swap.swap_previous("@parameter.inner")
      end)
    end,
  },
}
