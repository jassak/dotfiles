return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(args)
        local map = vim.keymap.set
        local opts = { buffer = args.buf, silent = true }

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>cr", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "<leader>cd", vim.diagnostic.open_float, opts)
        map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
        map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

        if vim.lsp.inlay_hint then
          map("n", "<leader>oi", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }),
              { bufnr = args.buf }
            )
          end, { buffer = args.buf, silent = true, desc = "Toggle inlay hints" })
        end
      end,
    })

    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "basic",
            diagnosticMode = "workspace",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    vim.lsp.config("ruff", {
      init_options = {
        settings = {
          configuration = "~/.config/ruff/ruff.toml",
        },
      },
    })

    vim.lsp.enable("basedpyright")
    vim.lsp.enable("ruff")

  end,
}
