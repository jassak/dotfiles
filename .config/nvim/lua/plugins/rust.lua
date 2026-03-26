return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        hover_actions = { auto_focus = true },
      },
      server = {
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, silent = true }

          -- LSP keymaps
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>cf",  vim.lsp.buf.format, opts)

          -- Rust-specific
          vim.keymap.set("n", "<leader>rr", function()
            vim.cmd.RustLsp("runnables")
          end, opts)
          vim.keymap.set("n", "<leader>rd", function()
            vim.cmd.RustLsp("debuggables")
          end, opts)
          vim.keymap.set("n", "<leader>re", function()
            vim.cmd.RustLsp("expandMacro")
          end, opts)
        end,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy", -- use clippy instead of check
            },
            cargo = {
              allFeatures = true,
            },
          },
        },
      },
    }
  end,
}
