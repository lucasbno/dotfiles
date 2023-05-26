---@diagnostic disable: undefined-global
local wibox = require 'wibox'
local beautiful = require 'beautiful'
local helpers = require 'helpers'
local gears = require 'gears'
local awful = require 'awful'

playerctl = bling.signal.playerctl.lib {
    ignore = {"chromium", "brave-browser", "brave"},
    player = {"spotify", "%any"}
}

playerctl_cli = bling.signal.playerctl.cli {
    ignore = {"chromium", "brave"},
    player = {"spotify", "%any"}
}

local dpi = beautiful.xresources.apply_dpi

local title = wibox.widget {
  markup = '<b>No music</b>',
  align = 'center',
  widget = wibox.widget.textbox,
}

local artist = wibox.widget {
  markup = 'No artist',
  font = beautiful.font .. ' ' .. tostring(tonumber(beautiful.font_size) - 1),
  widget = wibox.widget.textbox,
}

-- controls
local function base_control_button(default_icon, font)
  local btn = wibox.widget {
    {
      {
        id = 'icon_role',
        markup = default_icon,
        align = 'center',
        font = font or beautiful.nerd_font .. ' 14',
        widget = wibox.widget.textbox,
      },
      top = dpi(1),
      bottom = dpi(1),
      left = dpi(11),
      right = dpi(11),
      widget = wibox.container.margin,
    },
    shape = helpers.mkroundedrect(dpi(4)),
    bg = beautiful.black,
    widget = wibox.widget.background,
    set_txt = function(self, value)
      self:get_children_by_id('icon_role')[1].markup = value
    end
  }

  return btn
end

local previous = base_control_button('󰙣 ')
local pause = base_control_button(' ')
local next = base_control_button('󰙡 ')

-- WIP
local shuffle = base_control_button('怜')

-- controls buttons
previous:add_button(awful.button({}, 1, function()
  playerctl_cli:previous()
end))

pause:add_button(awful.button({}, 1, function()
  playerctl_cli:play_pause()
end))

next:add_button(awful.button({}, 1, function()
  playerctl_cli:next()
end))

-- make connection to playerctl
playerctl:connect_signal('metadata', function(_, music_title, music_artist, music_album_path)
  title:set_markup_silently('<b>' .. helpers.limit_by_length(music_title, 24, false) .. '</b>')
  artist:set_markup_silently('By ' .. helpers.limit_by_length(music_artist, 19, true))
end)

playerctl:connect_signal('no_players', function()
  title:set_markup_silently('No music')
  pause:set_markup('')
end)

playerctl:connect_signal('playback_status', function(_, playing)
  pause.txt = playing
      and ' '
      or ' '
end)

local music_player = wibox.widget {
  {
    title,
    previous,
    pause,
    next,
    spacing = dpi(5),
    layout = wibox.layout.fixed.horizontal,
  },
  shape = helpers.mkroundedrect(),
  bg = beautiful.bg_contrast,
  widget = wibox.container.background,
}

return music_player
