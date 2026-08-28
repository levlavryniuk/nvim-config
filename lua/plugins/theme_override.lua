local omarchy_spec = dofile(vim.fn.expand("~/.config/aether/theme/neovim.lua"))

for _, spec in ipairs(omarchy_spec) do
  if type(spec) == "table" and spec.priority == 1000 then
    spec.opts = vim.tbl_deep_extend("force", spec.opts or {}, {
      transparent = true,
      transparent_background = true, -- for catppuccin/tokyonight compatibility
    })
  end
end

return omarchy_spec
