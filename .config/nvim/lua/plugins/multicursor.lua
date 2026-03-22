return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "VeryLazy",
    config = function()
      local mc = require("multicursor-nvim")
      local map = vim.keymap.set

      mc.setup()

      -- Add the next/previous match as a cursor
      map({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Add cursor to next match" })
      map({ "n", "x" }, "<C-p>", function() mc.matchAddCursor(-1) end, { desc = "Add cursor to previous match" })

      -- Add cursors by line
      map("n", "<C-J>", function () mc.lineAddCursor(1) end, { desc = "Add cursor below" })
      map("n", "<C-K>", function () mc.lineAddCursor(-1) end, { desc = "Add cursor above" })

      -- Add and remove cursors with control + left click.
      map("n", "<c-leftmouse>", mc.handleMouse)
      map("n", "<c-leftdrag>", mc.handleMouseDrag)
      map("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Optional: select all matches
      map({ "n", "x" }, "<leader>ma", mc.matchAllAddCursors, { desc = "Add cursors to all matches" })

      -- Optional: toggle/disable cursors
      map({ "n", "x" }, "<C-q>", mc.toggleCursor, { desc = "Toggle multicursor" })

      -- These mappings exist ONLY while multicursor mode is active
      mc.addKeymapLayer(function(layerSet)
        -- q skips the next match only in multicursor mode
        layerSet({ "n", "x" }, "q", function()
          mc.matchSkipCursor(1)
        end)

        -- Q skips the previous match
        layerSet({ "n", "x" }, "Q", function()
          mc.matchSkipCursor(-1)
        end)

        -- Escape clears/enables cursors, like in the README example
        layerSet("n", "<Esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Cursor highlight groups
      vim.api.nvim_set_hl(0, "MultiCursorCursor", { reverse = true })
      vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
      vim.api.nvim_set_hl(0, "MultiCursorMatchPreview", { link = "Search" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { reverse = true })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
