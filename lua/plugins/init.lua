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
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = false,
          save_on_change = true,
          enter_on_sendcmd = false,
          tmux_autoclose_windows = false,
          excluded_filetypes = { "harpoon" },
          mark_branch = true,
          tabline = true,
          tabline_prefix = "   ",
          tabline_suffix = "   ",
        }
      })
      require("telescope").load_extension("harpoon")
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          enabled = true,
          accept = "<C-q>",
          accept_word = true
        },
        panel = {
          enabled = false
        }
      })

      -- Map <C-q> explicitly for Copilot accept
      vim.keymap.set("i", "<C-q>", function()
        require("copilot.suggestion").accept()
      end, { silent = true, noremap = true, desc = "Copilot Accept Completion" })
    end,
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
  },
  {

    "sindrets/diffview.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "DiffviewOpen", "DiffviewClose" },
    config = function()
      require("diffview").setup()
    end,
  },
}
