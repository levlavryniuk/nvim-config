return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        window = {
          width = 30,
          auto_expand_width = true,
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_by_pattern = {
              "*/node_modules",
            },
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
      })
    end,
  },
}
