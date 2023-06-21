modkey = "Mod4"
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

local function view_nonempty(i, screen)
        screen = screen or awful.screen.focused()
        local tags = screen.tags
        local showntags = {}
        for _, t in ipairs(tags) do
                if not awful.tag.getproperty(t, "hide") then
                        table.insert(showntags, t)
                end
        end
        local sel = screen.selected_tag
        -- Up to now, this is just copy&paste from awful.tag.viewidx().
        -- The rest is different
        local t = gears.table.cycle_value(showntags, sel, nil, function(t)
                return #t:clients() > 0
        end)
        if t then
                awful.tag.viewnone(screen)
                t.selected = true
                screen:emit_signal("tag::history::update")
        end
end

-- {{{ Mouse bindings
root.buttons(gears.table.join(
  awful.button({}, 3, function() mymainmenu:toggle() end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings

globalkeys = gears.table.join(
-- Awesome
  awful.key({ modkey }, 'r', awesome.restart),

  -- Window management
  awful.key({ modkey }, 'Tab', function() awful.client.focus.byidx(1) end),
  awful.key({ modkey }, 'l', function() awful.client.focus.byidx(1) end),
  awful.key({ modkey }, 'h', function() awful.client.focus.byidx(-1) end),
  awful.key({ modkey }, 'Right', function() awful.tag.incmwfact(0.025) end),
  awful.key({ modkey }, 'Left', function() awful.tag.incmwfact(-0.025) end),
  awful.key({ modkey }, 'Up', function() awful.client.incwfact(0.05) end),
  awful.key({ modkey }, 'Down', function() awful.client.incwfact(-0.05) end),
  -- awful.key({ modkey }, 'BackSpace', awful.tag.history.restore),
  awful.key({ modkey }, 'BackSpace', function() awful.client.focus.byidx(-1) end),
  awful.key({}, 'F23', function() view_nonempty() end),
  awful.key({}, 'F24', awful.tag.history.restore),

  -- Applications
  -- awful.key({ modkey }, 'e', function() awful.spawn(terminal .. " -e ranger") end),
  awful.key({ modkey }, 'e', function() awful.spawn("nemo") end),
  awful.key({ modkey }, 'd', function() awful.spawn("rofi -show drun -show-icons") end),
  awful.key({ modkey }, 'b', function() awful.spawn.with_shell(terminal .. " -e ranger ~/books/") end),
  awful.key({ modkey }, 'Escape', function() awesome.emit_signal('powermenu::toggle') end),
  awful.key({ modkey, }, 'Return', function()
    awful.client.run_or_raise(terminal, function(c)
      return awful.rules.match(c, { class = "Alacritty" })
    end, function(c)
      c:move_to_tag(awful.screen.focused().selected_tag)
    end)
  end),

  -- Screenshots
  awful.key({}, 'Print', function() awful.util.spawn("flameshot gui") end)
)

-- Keyboard Control
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

-- Cycle only through non-empty tags

clientbuttons = gears.table.join(
  awful.button({}, 1, function(c) client.focus = c end),
  awful.button({ modkey }, 1, function() awful.mouse.client.move() end),
  awful.button({ modkey }, 3, function() awful.mouse.client.resize() end)
)

root.keys(globalkeys)
