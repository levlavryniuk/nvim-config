require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = { "ts_ls", "html", "cssls", "clangd", "tailwindcss", "svelte" }
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
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)

      if lsp == "tsserver" or lsp == "svelte" then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = organize_and_remove_imports,
        })
      end
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.tailwindcss.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "html", "css", "javascriptreact", "typescriptreact", "svelte" }, -- Adjust filetypes as needed
}
