return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindCSS = {
          includeLanguages = { rust = "html", clojurescript = "html" },
          experimental = {
            classRegex = {
              { "\\[:[^.\\s]*((?:\\.[^.\\s\\]]*)+)[\\s\\]]", "\\.([^.]*)" },
              { "\\:class\\s+(\\:[^\\s\\}]*)[\\s\\}]", "[\\:.]([^.]*)" },
              { '\\:class\\s+("[^\\}"]*)"', '["\\s]([^\\s"]*)' },
              { "\\:class\\s+\\[([\\s\\S]*)\\]", '["\\:]([^\\s"]*)["]?' },
              { "\\:class\\s+'\\[([\\s\\S]*)\\]", "([^\\s]*)?" },
            },
          },
        },
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
        rust_analyzer = {
          cargo = {
            allFeatures = false,
            loadOutDirsFromCheck = true,
            features = { "postgres" },
          },
        },
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp" },
        },
      },
    },
  },
}
