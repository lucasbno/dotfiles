---@diagnostic disable: undefined-global
local awful = require "awful"

local function set_layouts()
  tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts {
      awful.layout.suit.tile.left,
      awful.layout.suit.floating,
      awful.layout.suit.fair,
      -- bling.layout.mstab
      -- awful.layout.suit.fair.horizontal,
      -- awful.layout.suit.spiral,
      -- awful.layout.suit.tile.bottom,
      -- awful.layout.suit.max,
      -- awful.layout.suit.corner.nw,
      -- awful.layout.suit.magnifier,
      -- awful.layout.suit.max.fullscreen,
      -- awful.layout.suit.spiral.dwindle,
      -- awful.layout.suit.tile.top,
      -- awful.layout.suit.corner.ne,
      -- awful.layout.suit.corner.sw,
      -- awful.layout.suit.corner.se,
    }
  end)
end

set_layouts()
