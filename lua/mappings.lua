require "nvchad.mappings"

local map = vim.keymap.set
local bufnr = vim.api.nvim_get_current_buf()
local cmp = require('cmp')

-- CMD enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Escape to normal mode
map("i", "jk", "<ESC>")
map("i", "<Esc>", "<Esc>", { noremap = true, silent = true })


-- Tmux navigator in normal mode
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Add terminal mode mappings for navigation
map("t", "<C-h>", [[<C-\><C-n><cmd> TmuxNavigateLeft<CR>]], { desc = "window left in terminal" })
map("t", "<C-l>", [[<C-\><C-n><cmd> TmuxNavigateRight<CR>]], { desc = "window right in terminal" })
map("t", "<C-j>", [[<C-\><C-n><cmd> TmuxNavigateDown<CR>]], { desc = "window down in terminal" })
map("t", "<C-k>", [[<C-\><C-n><cmd> TmuxNavigateUp<CR>]], { desc = "window up in terminal" })

-- LSP mappings
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { silent = true, buffer = bufnr })

map("n", "gh", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Rust LSP specific
-- map("n", "<leader>ca", function()
--   vim.cmd.RustLsp "codeAction"
-- end, { silent = true, buffer = bufnr })

-- Buffer navigation
map("n", "<C-i>", ":bprev<CR>", { noremap = true, silent = true })
map("n", "<C-o>", ":bnext<CR>", { noremap = true, silent = true })

-- Telescope undo
map("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- Save with Ctrl+S
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Rust binds
local opts = { noremap = true, silent = true, buffer = bufnr }

map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'K', vim.lsp.buf.hover, opts)
map("i", "<C-q>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
