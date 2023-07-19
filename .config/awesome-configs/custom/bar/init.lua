local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local lain = require "lain"
local beautiful = require 'beautiful'
local dpi = beautiful.xresources.apply_dpi
local helpers = require 'helpers'
local markup = lain.util.markup

require 'bar.calendar'
require 'bar.powermenu'
local music = require 'bar.music'

------------------------------Tags--------------------------------------

local taglist_buttons = gears.table.join(awful.button({}, 1, function(t)
  t:view_only()
end), awful.button({ modkey }, 1, function(t)
  if client.focus then
    client.focus:move_to_tag(t)
  end
end), awful.button({}, 3, awful.tag.viewtoggle), awful.button({ modkey }, 3, function(t)
  if client.focus then
    client.focus:toggle_tag(t)
  end
end), awful.button({}, 4, function(t)
  awful.tag.viewnext(t.screen)
end), awful.button({}, 5, function(t)
  awful.tag.viewprev(t.screen)
end))

screen.connect_signal('request::desktop_decoration', function(s)
  -- awful.screen.connect_for_each_screen(function(s)
  -- Each screen has its own tag table.
  awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 " }, s, awful.layout.layouts[1])

  -- Layout boxes
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(awful.button({}, 1, function()
    awful.layout.inc(1)
  end), awful.button({}, 3, function()
    awful.layout.inc(-1)
  end), awful.button({}, 4, function()
    awful.layout.inc(1)
  end), awful.button({}, 5, function()
    awful.layout.inc(-1)
  end)))

  -- Create a taglist widget
  s.mytaglist = wibox.widget {
    {
      widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
      },
    },
    bottom = 1,
    widget = wibox.container.margin
  }
  ------------------------------Clock and calendar--------------------------------------
  local clock_formats = {
    hour = '%a, %I:%M %p',
    day = '%d/%m/%Y'
  }
  local clock = wibox.widget {
    format = clock_formats.hour,
    widget = wibox.widget.textclock
  }
  local date = wibox.widget {
    {
      {
        clock,
        fg = beautiful.black,
        widget = wibox.container.background
      },
      margins = dpi(7),
      widget = wibox.container.margin
    },
    bg = beautiful.green,
    widget = wibox.container.background,
  }
  date:add_button(awful.button({}, 3, function()
    awesome.emit_signal('calendar::toggle')
  end))

  date:add_button(awful.button({}, 1, function()
    clock.format = clock.format == clock_formats.hour and clock_formats.day or clock_formats.hour
  end))

  local base_layoutbox = awful.widget.layoutbox {
    screen = s
  }

  ------------------------------Layouts button--------------------------------------
  -- remove built-in tooltip. base_layoutbox._layoutbox_tooltip:remove_from_object(base_layoutbox)
  base_layoutbox._layoutbox_tooltip:remove_from_object(base_layoutbox)
  -- create button container
  local layoutbox = helpers.mkbtn(base_layoutbox, beautiful.bg_normal, beautiful.dimblack)

  ------------------------------Cpu--------------------------------------
  local cpu = wibox.widget {
    {
      lain.widget.cpu {
        settings = function()
          widget:set_markup(markup.fontfg(beautiful.font, beautiful.black, "  CPU  " .. cpu_now.usage .. "% "))
        end,
      },
      bg = beautiful.blue,
      widget = wibox.container.background
    },
    top = 2,
    bottom = 2,
    forced_width = 86,
    widget = wibox.container.margin,
    --
  }

  ------------------------------Memory--------------------------------------
  local memory = wibox.widget {
    {
      lain.widget.mem {
        settings = function()
          widget:set_markup(" Memory " .. string.format(
              "%.1f",
              mem_now.used / 1000
            ) .. 'G ')
        end,
      },
      bg = beautiful.bg,
      widget = wibox.container.background
    },
    left = 14,
    right = 14,
    top = 2,
    bottom = 2,
    widget = wibox.container.margin,
  }

  ------------------------------Tray--------------------------------------
  local tray = wibox.widget {
    {
      widget = wibox.widget.systray(),
    },
    widget = wibox.container.margin,
    top = 4,
    right = 16,
    bottom = 4,
  }

  ------------------------------Volume--------------------------------------
  local volume = lain.widget.pulse {
    settings = function()
      vlevel = volume_now.left
      if volume_now.muted == "yes" then
        vlevel = "M"
      end
      widget:set_markup(lain.util.markup("#7493d2", ' ' .. vlevel))
    end
  }

  volume.widget:buttons(awful.util.table.join(
    awful.button({}, 3, function() -- middle click
      os.execute(string.format("pactl set-sink-volume %s 100%%", volume.device))
      volume.update()
    end),
    awful.button({}, 1, function() -- right click
      os.execute(string.format("pactl set-sink-mute %s toggle", volume.device))
      volume.update()
    end),
    awful.button({}, 4, function() -- scroll up
      os.execute(string.format("pactl set-sink-volume %s +1%%", volume.device))
      volume.update()
    end),
    awful.button({}, 5, function() -- scroll down
      os.execute(string.format("pactl set-sink-volume %s -1%%", volume.device))
      volume.update()
    end)
  ))

  function custom_shape(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, RADIUS)
  end

  ------------------------------Top bar--------------------------------------
  s.mywibox = awful.wibar({
    position = "top",
    screen = s,
    margins = {
      top = 8,
      left = 8,
      right = 8,
    },
    -- shape = helpers.mkroundedrect(4),
  })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    -- expand = "none",
    {
      -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mytaglist,
      layoutbox,
      {
       music,
       widget = wibox.container.margin,
       left = 12,
      }
      -- s.mypromptbox
    },
    -- s.mytasklist, -- Middle widget
    nil,
    {
      -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      tray,
      cpu,
      memory,
      date,
    }
  }
end)
