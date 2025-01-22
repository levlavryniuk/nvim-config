---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everblush",
  transparency = true,
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  telescope = { style = "bordered" },
  tabufline = {
    enabled = true
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
    format_colors = { tailwind = true }
  },
}

return M
