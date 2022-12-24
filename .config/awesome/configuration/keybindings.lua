local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require 'beautiful'
require 'configuration.powermenu'
require("../user")

function togglepmenu ()
  awesome.emit_signal('powermenu::toggle')
end

local function set_keybindings ()
  awful.keyboard.append_global_keybindings({
    -- Launchers
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "e", function () awful.spawn(explorer) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "d", function () awful.spawn.with_shell("~/.config/rofi/launcher/launcher.sh") end,
              {description = "open rofi launcher", group = "launcher"}),
    awful.key({                   }, "Print", function () awful.spawn.with_shell("flameshot gui") end,
              {description = "open rofi launcher", group = "launcher"}),
    awful.key({ modkey,           }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey,           }, "Escape", togglepmenu,
              {description = "quit awesome", group = "awesome"}),

    -- Tags Related
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous tag", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next tag", group = "tag"}),
    awful.key({}, "F9", awful.tag.history.restore,
              {description = "go back on tags", group = "tag"}),
    awful.key({modkey,            }, "BackSpace", awful.tag.history.restore,
              {description = "go back on tags", group = "tag"}),
  })

  -- Center a floating window
  awful.keyboard.append_global_keybindings({
    awful.key({modkey}, "Down", function ()
        awful.placement.centered(client.focus, {
            honor_workarea = true
        })
    end, { description = 'Center a floating window', group = 'client' })
})

-- Focus related keybindings
  awful.keyboard.append_global_keybindings({

    awful.key({ modkey,           }, "l",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),

    awful.key({ modkey,           }, "h",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "p",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "Focus previous client", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),
  })

  -- Layout related keybindings

  awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "=",     function () awful.tag.incmwfact( 0.02)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "-",     function () awful.tag.incmwfact(-0.02)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "Tab", function () awful.layout.inc(1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "Tab", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
  })

  -- Move through tags
  awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
})

-- Client keybindings
client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings({
      awful.key({ modkey,           }, "f",
          function (c)
              c.fullscreen = not c.fullscreen
              c:raise()
          end,
          {description = "toggle fullscreen", group = "client"}),
      awful.key({ modkey   }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
      awful.key({ modkey }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
      awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
      awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
      awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
      awful.key({ modkey,           }, "n",
          function (c)
              -- The client currently has the input focus, so it cannot be
              -- minimized, since minimized clients can't have the focus.
              c.minimized = true
          end ,
          {description = "minimize", group = "client"}),
      awful.key({ modkey,           }, "m",
          function (c)
            if c.maximized then
              awful.screen.focused().padding = { top = "0", bottom = "0", left = "0", right="0" }
            else
              awful.screen.focused().padding = { top = beautiful.useless_gap * 2, bottom = beautiful.useless_gap * 2, left = beautiful.useless_gap * 2, right=beautiful.useless_gap * 2 }
            end
            c.maximized = not c.maximized
            c:raise()
          end ,
          {description = "(un)maximize", group = "client"}),
      awful.key({ modkey, "Control" }, "m",
          function (c)
              c.maximized_vertical = not c.maximized_vertical
              c:raise()
          end ,
          {description = "(un)maximize vertically", group = "client"}),
      awful.key({ modkey, "Shift"   }, "m",
          function (c)
              c.maximized_horizontal = not c.maximized_horizontal
              c:raise()
          end ,
          {description = "(un)maximize horizontally", group = "client"}),
      })
  end)
end

set_keybindings()
