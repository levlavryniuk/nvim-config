return {
  -- Catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    config = function()
      require("fluoromachine").setup({
        glow = true,
        theme = "retrowave",
        transparent = true,
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
  },
  { "aliqyan-21/darkvoid.nvim" },
  -- TokyoNight
  { "folke/tokyonight.nvim", priority = 1000 },

  -- Kanagawa
  { "rebelot/kanagawa.nvim", priority = 1000 },

  -- Rose Pine
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },

  -- Nightfox
  { "EdenEast/nightfox.nvim", priority = 1000 },

  -- Onedark
  { "navarasu/onedark.nvim", priority = 1000 },

  -- Gruvbox
  { "ellisonleao/gruvbox.nvim", priority = 1000 },

  { "dgox16/oldworld.nvim", priority = 1000 },
  -- Everforest
  { "sainnhe/everforest", priority = 1000 },
  -- Dracula
  { "Mofiqul/dracula.nvim", priority = 1000 },

  -- GitHub themes
  { "projekt0n/github-nvim-theme", priority = 1000 },

  -- Solarized
  { "maxmx03/solarized.nvim", priority = 1000 },

  -- Ayu
  { "Shatur/neovim-ayu", priority = 1000 },

  -- Sonokai
  { "sainnhe/sonokai", priority = 1000 },

  -- Melange
  { "savq/melange-nvim", priority = 1000 },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          -- Catppuccin variants
          "catppuccin-latte",
          "catppuccin-frappe",
          "catppuccin-macchiato",
          "catppuccin-mocha",

          -- TokyoNight variants
          "tokyonight-day",
          "tokyonight-night",
          "tokyonight-storm",
          "tokyonight-moon",

          -- Kanagawa
          "kanagawa",

          -- Rose Pine variants
          "rose-pine",
          "rose-pine-moon",
          "rose-pine-dawn",

          -- Nightfox variants
          "nightfox",
          "nordfox",
          "dawnfox",
          "terafox",
          "carbonfox",

          -- OneDark
          "onedark",

          -- Gruvbox
          "gruvbox",

          -- Everforest
          "everforest",

          -- Dracula
          "dracula",

          -- GitHub themes
          "github_dark",
          "github_light",

          -- Solarized
          "solarized",

          -- Ayu variants
          "ayu-dark",
          "ayu-light",
          "ayu-mirage",

          -- Sonokai
          "sonokai",

          -- Melange
          "melange",
          "oldworld",
          "fluoromachine",
          "gruvbox-material",
          "darkvoid",
        },
        livePreview = true,
      })
    end,
  },
}
