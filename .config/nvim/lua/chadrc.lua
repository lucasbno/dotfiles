---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "rosepine",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = { load_on_startup = true }

M.ui = {
  tabufline = {
    enabled = false,
  },
  statusline = {
    enabled = true,
    theme = "vscode_colored",
  },
}

return M
