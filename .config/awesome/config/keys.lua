local helpers = require("helpers")

-- ##############################################################
-- #                        Mouse bindings                     #
-- ##############################################################
root.buttons(gears.table.join(
  awful.button({}, 3, function() mymainmenu:toggle() end)
))

-- ##############################################################
-- #                        Key bindings                       #
-- ##############################################################
globalkeys = gears.table.join(
  awful.key({ modkey }, 'r', awesome.restart),

  awful.key({ modkey }, 'Tab', function() awful.client.focus.byidx(1) end),
  awful.key({ modkey }, 'l', function() awful.client.focus.byidx(1) end),
  awful.key({ modkey }, 'h', function() awful.client.focus.byidx(-1) end),
  awful.key({ modkey }, 'Right', function() awful.tag.incmwfact(0.025) end),
  awful.key({ modkey }, 'Left', function() awful.tag.incmwfact(-0.025) end),
  awful.key({ modkey }, 'Up', function() awful.client.incwfact(0.05) end),
  awful.key({ modkey }, 'Down', function() awful.client.incwfact(-0.05) end),

  awful.key({ modkey }, 'BackSpace', awful.tag.history.restore),

  awful.key({}, 'F23', function() helpers.view_nonempty() end),
  awful.key({}, 'F24', awful.tag.history.restore),
  awful.key({ modkey }, 'k', awful.tag.history.restore),

  -- Tabbed (bling) keybindings
  awful.key({ modkey }, "p", function() bling.module.tabbed.pick() end,
    {description = "pick client to add to tab group", group = "tabbed"}),
  awful.key({ modkey, "Shift" }, "l", function() bling.module.tabbed.pop() end,
    {description = "remove focused client from tab group", group = "tabbed"}),
  awful.key({ modkey, "Shift" }, "h", function() bling.module.tabbed.pop() end,
    {description = "remove focused client from tab group", group = "tabbed"}),
  awful.key({ modkey }, "w", function() bling.module.tabbed.pick_by_direction("left") end,
    {description = "pick client to the left", group = "tabbed"}),
  awful.key({ modkey }, "w", function() bling.module.tabbed.pick_by_direction("right") end,
    {description = "pick client to the right", group = "tabbed"}),

-- ##############################################################
-- #                        Applications                        #
-- ##############################################################
  awful.key({ modkey }, 'e', function() awful.spawn(file_manager) end),
  awful.key({ modkey }, 'd', function() awful.spawn.with_shell("/home/lucasbno/.config/rofi/launchers/type-4/launcher.sh") end),
  awful.key({ modkey }, 'b', function() awful.spawn.with_shell(terminal .. " -e ranger ~/books/") end),
  awful.key({ modkey }, 'Escape', function() awesome.emit_signal('powermenu::toggle') end),
  awful.key({ modkey}, 'Return', function() helpers.smart_terminal(terminal, "Alacritty") end),
  awful.key({ modkey }, 'Delete', function() awful.util.spawn(screenshot_tool) end)
)

-- ##############################################################
-- #                        Keyboard Control                   #
-- ##############################################################
clientkeys = gears.table.join(
  awful.key({ modkey }, 'q', function(c) c:kill() end),
  awful.key({ modkey }, 'f', function(c)
    c.fullscreen = not c.fullscreen;
    c:raise()
  end),
  awful.key({ modkey }, 'space', function() awful.client.floating.toggle() end),
  awful.key({ modkey, }, "m",
    function(c)
      if c.maximized then
        awful.screen.focused().padding = { top = "0", bottom = "0", left = "0", right = "0" }
      else
        awful.screen.focused().padding = {
          top = beautiful.useless_gap * 2,
          bottom = beautiful.useless_gap * 2,
          left = beautiful.useless_gap * 2,
          right = beautiful.useless_gap * 2
        }
      end
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "(un)maximize", group = "client" })
)

for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end)
  )
end

clientbuttons = gears.table.join(
  awful.button({}, 1, function(c) client.focus = c end),
  awful.button({ modkey }, 1, function() awful.mouse.client.move() end),
  awful.button({ modkey }, 3, function() awful.mouse.client.resize() end)
)

root.keys(globalkeys)
