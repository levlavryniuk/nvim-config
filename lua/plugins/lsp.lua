return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {
          mason = false,
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
          capabilities = {
            workspace = {
              didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
            },
          },
        },
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp" },
        },
      },
    },
  },
}
