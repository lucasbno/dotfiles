local keys = {}

local modkey = 'Mod4'
local tags = 6
keys.tags = tags

-- Keybindings
keys.globalkeys = gears.table.join(
-- Awesome
  awful.key({ modkey }, 'r', awesome.restart),
  -- awful.key({modkey}, 'd', function() dashboard.toggle() end),

  -- Window management
  awful.key({ modkey }, 'Tab', function() awful.client.focus.byidx(1) end),
  awful.key({ modkey }, 'l', function() awful.client.focus.byidx(1) end),
  awful.key({ modkey }, 'h', function() awful.client.focus.byidx(-1) end),

  awful.key({ modkey }, 'Right', function() awful.tag.incmwfact(0.025) end),
  awful.key({ modkey }, 'Left', function() awful.tag.incmwfact(-0.025) end),
  awful.key({ modkey }, 'Up', function() awful.client.incwfact(0.05) end),
  awful.key({ modkey }, 'Down', function() awful.client.incwfact(-0.05) end),
  awful.key({ modkey }, 'BackSpace', awful.tag.history.restore),
  awful.key({ }, 'F9', awful.tag.history.restore),


  -- Applications
  awful.key({ modkey }, 'Return', function() awful.util.spawn(terminal) end),
  awful.key({ modkey }, 'e', function() awful.util.spawn(terminal .. " -e ranger") end),
  awful.key({ modkey}, 'd', function() awful.spawn("rofi -show drun")end),

  -- Screenshots
  awful.key({}, 'Print', function() awful.util.spawn(screenshot_tool) end)
)

-- Keyboard Control
keys.clientkeys = gears.table.join(
  awful.key({ modkey }, 'q', function(c) c:kill() end),
  awful.key({ modkey }, 'f', function(c) c.fullscreen = not c.fullscreen; c:raise() end),
  awful.key({ modkey }, 'space', function() awful.client.floating.toggle() end),
  awful.key({ modkey, }, "m",
    function(c)
      if c.maximized then
        awful.screen.focused().padding = { top = "0", bottom = "0", left = "0", right = "0" }
      else
        awful.screen.focused().padding = { top = beautiful.useless_gap * 2, bottom = beautiful.useless_gap * 2,
          left = beautiful.useless_gap * 2, right = beautiful.useless_gap * 2 }
      end
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "(un)maximize", group = "client" })
)

-- Mouse controls
keys.clientbuttons = gears.table.join(
  awful.button({}, 1, function(c) client.focus = c end),
  awful.button({ modkey }, 1, function() awful.mouse.client.move() end),
  awful.button({ modkey }, 3, function() awful.mouse.client.resize() end)
)

for i = 1, tags do
  keys.globalkeys = gears.table.join(keys.globalkeys,

    -- View tag
    awful.key({ modkey }, '#' .. i + 9,
      function()
        local tag = awful.screen.focused().tags[i]
        if tag then
          tag:view_only()
        end
      end),

    -- Move window to tag
    awful.key({ modkey, 'Shift' }, '#' .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end))
end

-- Set globalkeys
root.keys(keys.globalkeys)

return keys
