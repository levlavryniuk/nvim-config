local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { 'clang-format' },
    css = { "prettier" },
    html = { "prettier" },
    svelte = { "prettier" },
    javascript = { "prettier", "prettierd", stop_after_first = true },
    typescript = { "prettier", "prettierd", stop_after_first = true },
    typescriptreact = { "prettier", "prettierd", stop_after_first = true },
    go = { 'gofmt' },
    rust = { "clippy" }
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1500,
    lsp_fallback = true,
  },
}

return options
