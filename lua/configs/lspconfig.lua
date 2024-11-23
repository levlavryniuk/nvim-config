require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Define servers
local servers = { "ts_ls", "html", "cssls", "clangd", "svelte", "tailwindcss", "astro", "gopls", "sqlls", 'emmet_ls' }

-- Import organizing function
local function organize_and_remove_imports()
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports", "source.fixAll" } }

  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit or type(r.command) == "table" then
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
        end
        if type(r.command) == "table" then
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end
end

-- Setup LSPs
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Rust analyzer setup
-- lspconfig.rust_analyzer.setup({
--   settings = {
--     ['rust-analyzer'] = {
--       inlayHints = {
--         typeHints = { enable = false },
--         parameterHints = { enable = false },
--         chainingHints = { enable = false },
--       },
--     },
--   },
--   on_attach = function(client, bufnr)
--     local opts = { noremap = true, silent = true, buffer = bufnr }
--
--     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--
--     if client.server_capabilities.documentFormattingProvider then
--       vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
--     end
--   end,
--   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- })
--
-- Tailwind CSS setup with modified filetypes
lspconfig.svelte.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = organize_and_remove_imports,
    })
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Tailwind setup with specific handling for Svelte files
lspconfig.tailwindcss.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte", -- Allow Tailwind in `.svelte` files conditionally
  },
}

-- Go setup for additional LSP commands
lspconfig.gopls.setup {
  cmd = { "gopls" },
  settings = { gopls = { completeUnimported = true, analyses = { unusedparams = true } } },
  on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  end,
}

-- Add any additional custom functions or configurations here.
