local function fugitive_readability()
  local set = vim.api.nvim_set_hl

  -- clearer section headers
  set(0, "gitcommitSummary", { bold = true })

  -- brighter staged/unstaged markers
  set(0, "diffAdded", { fg = "#9ece6a", bold = true })
  set(0, "diffRemoved", { fg = "#f7768e", bold = true })

  vim.api.nvim_set_hl(0, "Title", { fg = "#7aa2f7", bold = true })
  vim.opt.fillchars:append({ diff = "╱" })
end

fugitive_readability()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = fugitive_readability,
})

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,

      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },

      attach_to_untracked = true,

      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

      sign_priority = 6,
      update_debounce = 100,
      max_file_length = 40000,

      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },

      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            silent = true,
            desc = desc,
          })
        end

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]h", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next hunk")

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[h", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Previous hunk")

        -- Actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")
        map("n", "<leader>hd", gs.diffthis, "Diff this")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Diff this ~")
        map("n", "<leader>hT", gs.toggle_deleted, "Toggle deleted")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
      end,
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
    },
    keys = {
      { "<M-g>", "<cmd>tab Git<cr>", desc = "Git status" },
      { "<leader>gh", "<cmd>0Gclog<cr>", desc = "Git file history" },
    },
  },
}
