return {
  {
    "vimwiki/vimwiki",
    lazy = false,
    ft = { "markdown" },
    keys = {
      { "<leader>wi", "<cmd>VimwikiIndex<cr>", desc = "Wiki index" },
      { "<leader>wD", "<cmd>VimwikiDiaryIndex<cr>", desc = "Wiki diary" },
      { "<leader>wN", "<cmd>edit ~/Dropbox/wiki/notes/index.md<cr>", desc = "Wiki notes" },
      { "<leader>wP", "<cmd>edit ~/Dropbox/wiki/projects/index.md<cr>", desc = "Wiki projects" },
      {
        "<leader>wf",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.expand("~/Dropbox/wiki") })
        end,
        desc = "Wiki files",
      },
      {
        "<leader>wg",
        function()
          require("telescope.builtin").live_grep({ cwd = vim.fn.expand("~/Dropbox/wiki") })
        end,
        desc = "Wiki grep",
      },
      {
        "<leader>wb",
        function()
          require("telescope.builtin").grep_string({
            cwd = vim.fn.expand("~/Dropbox/wiki"),
            search = vim.fn.expand("<cword>"),
          })
        end,
        desc = "Wiki grep word",
      },
    },

    init = function()
      vim.g.vimwiki_list = {
        {
          path = vim.fn.expand("~/Dropbox/wiki/"),
          syntax = "markdown",
          ext = ".md",
          diary_rel_path = "diary/",
          diary_index = "index",
          auto_diary_index = 1,
          auto_tags = 1,
        },
      }

      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_markdown_link_ext = 1
      vim.g.vimwiki_use_mouse = 1

      -- Reduce Vimwiki-specific highlighting
      vim.g.vimwiki_hl_headers = 0
      vim.g.vimwiki_hl_cb_checked = 0
    end,

    config = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        group = vim.api.nvim_create_augroup("VimwikiDiaryLinks", { clear = true }),
        pattern = "*/Dropbox/wiki/diary/*.md",
        callback = function()
          vim.cmd("VimwikiDiaryGenerateLinks")
        end,
      })

      -- Tell Treesitter to use the markdown parser for vimwiki buffers
      vim.treesitter.language.register("markdown", "vimwiki")
      vim.treesitter.language.register("markdown_inline", "vimwiki")
    end,
  },
}
