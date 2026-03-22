return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        markdown = true,
        help = false,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)

      local suggestion = require("copilot.suggestion")
      local luasnip = require("luasnip")
      local map = vim.keymap.set

      map("i", "<Tab>", function()
        if suggestion.is_visible() then
          suggestion.accept()
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
            "n",
            false
          )
        end
      end, { silent = true, desc = "Copilot accept or snippet jump" })

      map("i", "<S-Tab>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true),
            "n",
            false
          )
        end
      end, { silent = true, desc = "Snippet jump backward" })
    end,
  },
}
