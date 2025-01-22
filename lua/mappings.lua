require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del
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
-- Remove NvChad default mappings for <leader>h and <leader>v
del("n", "<leader>h")
del("n", "<leader>v")

-- Add terminal mode mappings for navigation
map("t", "<C-h>", [[<C-\><C-n><cmd> TmuxNavigateLeft<CR>]], { desc = "window left in terminal" })
map("t", "<C-l>", [[<C-\><C-n><cmd> TmuxNavigateRight<CR>]], { desc = "window right in terminal" })
map("t", "<C-j>", [[<C-\><C-n><cmd> TmuxNavigateDown<CR>]], { desc = "window down in terminal" })
map("t", "<C-k>", [[<C-\><C-n><cmd> TmuxNavigateUp<CR>]], { desc = "window up in terminal" })

map("n", "<leader>gtd", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })

-- LSP mappings
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { silent = true, buffer = bufnr })

map("n", "gh", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Buffer navigation
map("n", "<C-i>", ":bprev<CR>", { noremap = true, silent = true })
map("n", "<C-o>", ":bnext<CR>", { noremap = true, silent = true })

map('n', '<leader>rn', vim.lsp.buf.rename, { noremap = true, silent = true })
-- Telescope undo
map("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- Save with Ctrl+S
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local opts = { noremap = true, silent = true, buffer = bufnr }

map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'K', vim.lsp.buf.hover, opts)

-- Add current file to Harpoon
map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon: Add file" })

-- Remove file from harpoon
vim.keymap.set("n", "<leader>hr", function()
  require("harpoon.mark").rm_file()
end, { desc = "Harpoon: Remove current file" })

-- Toggle Harpoon menu
map("n", "<leader>hm", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon: Toggle menu" })

-- Navigate between files
map("n", "<leader>h1", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon: Go to file 1" })

map("n", "<leader>h2", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "Harpoon: Go to file 2" })

map("n", "<leader>h3", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "Harpoon: Go to file 3" })

map("n", "<leader>h4", function()
  require("harpoon.ui").nav_file(4)
end, { desc = "Harpoon: Go to file 4" })


-- Telescope Integration for Marks
map("n", "<leader>hf", "<cmd>Telescope harpoon marks<CR>", { desc = "Harpoon: Telescope Marks" })

-- Restart LSP
map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
