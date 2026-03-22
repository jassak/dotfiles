return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["gd"] = {
          desc = "Toggle details",
          callback = function()
            local oil = require("oil")
            local buf = vim.api.nvim_get_current_buf()
            local current = vim.b[buf].oil_show_details

            if current then
              oil.set_columns({ "icon" })
              vim.b[buf].oil_show_details = false
            else
              oil.set_columns({ "icon", "size"})
              vim.b[buf].oil_show_details = true
            end
          end,
        },
        ["yp"] = {
          desc = "Copy full path",
          callback = function()
            local oil = require("oil")
            local entry = oil.get_cursor_entry()
            local dir = oil.get_current_dir()

            if not entry or not dir then
              return
            end

            local path = dir
            if not path:match("/$") then
              path = path .. "/"
            end
            path = path .. entry.name

            vim.fn.setreg("+", path)
            vim.fn.setreg('"', path)
            vim.notify("Copied: " .. path)
          end,
        },
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
}
