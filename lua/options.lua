require "nvchad.options"

local hl = vim.api.nvim_set_hl

hl(0, 'DiffviewDiffAdd', { fg = '#B8E2A5', bg = '#1C3320' })          -- Brighter green on darker bg
hl(0, 'DiffviewStatusAdded', { fg = '#A8D696', bg = '#162718' })      -- Slightly muted for status

hl(0, 'DiffviewDiffDelete', { fg = '#FF8B82', bg = '#3B1515' })       -- Vibrant red on deep bg
hl(0, 'DiffviewStatusDeleted', { fg = '#F07878', bg = '#2D1212' })    -- Softer red for status

hl(0, 'DiffviewDiffChange', { fg = '#E3C78A', bg = '#2D2A1A' })       -- Muted gold
hl(0, 'DiffviewStatusModified', { fg = '#D4B675', bg = '#252216' })   -- Slightly darker

hl(0, 'DiffviewDiffText', { fg = '#FFD23F', bg = '#614219' })         -- Bright gold on dark brown

hl(0, 'DiffviewFilePanelTitle', { fg = '#8FDBEB', bg = '#232831' })   -- Brighter blue
hl(0, 'DiffviewFilePanelCounter', { fg = '#C8A5D4', bg = '#232831' }) -- Lighter purple
hl(0, 'DiffviewFilePanelRoot', { fg = '#8FBCD9', bg = '#232831' })    -- Softer blue
