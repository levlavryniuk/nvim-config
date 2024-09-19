---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  telescope = { style = "bordered" },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
}

return M
