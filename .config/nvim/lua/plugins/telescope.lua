local actions = require('telescope.actions')

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      -- General
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Word under cursor" },
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search current buffer" },

      -- LSP
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
      { "<leader>fa", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>fR", "<cmd>Telescope resume<cr>", desc = "Resume picker" },

      -- Git
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },

      -- Wiki
      {
        "<leader>wf",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("~/Dropbox/wiki"),
          })
        end,
        desc = "Wiki files",
      },
      {
        "<leader>wg",
        function()
          require("telescope.builtin").live_grep({
            cwd = vim.fn.expand("~/Dropbox/wiki"),
          })
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
      {
        "<leader>ag",
        function()
          require("telescope.builtin").live_grep({
            cwd = vim.fn.expand("~/ai"),
            prompt_title = "AI Chats",
          })
        end,
        desc = "AI chats grep",
      }
    },
    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          mappings = {
            i = {
              ["<Esc>"] = actions.close,
              ["<c-d>"] = actions.delete_buffer,
            },
            n = {
              ["<c-d>"] = actions.delete_buffer,
              ["dd"] = actions.delete_buffer,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          current_buffer_fuzzy_find = {
            previewer = false,
          },
          lsp_document_symbols = {
            symbol_width = 50,
          },
          buffers = {
            sort_lastused = true,
            ignore_current_buffer = true,
          },
        },
      }
    end,
  },
}
