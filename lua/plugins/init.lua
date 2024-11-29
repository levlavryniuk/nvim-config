return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        keymap = {
          accept = "<C-q>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "configs.lspconfig"
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
      },
      config = function()
        require("telescope").setup {
          extensions = {
            undo = {
            },
          },
        }
        require("telescope").load_extension "undo"
      end,
    },
    {
      "luckasRanarison/tailwind-tools.nvim",
      name = "tailwind-tools",
      build = ":UpdateRemotePlugins",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
      },
      opts = {}
    },
    {
      "mrcjkb/rustaceanvim",
      version = "^5",
      lazy = false,
    },

    {
      "saecki/crates.nvim",
      tag = "stable",
      config = function()
        require("crates").setup {
          completion = {
            cmp = { enabled = true },
          },
        }
        require("cmp").setup.buffer {
          sources = { { name = "crates" } },
        }
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "vim", "lua", "vimdoc",
          "html", "css", "svelte", "typescript", "javascript"
        },
        highlight = { enabled = true }
      },
    }
  } }
