  pcall(require, "luarocks.loader")
  local gears = require("gears")
  local awful = require("awful")
  require("awful.autofocus")
  local beautiful = require("beautiful")
  local menubar = require("menubar")
  beautiful.init("/home/lucasbno/.config/awesome/theme.lua")
  require("awful.hotkeys_popup.keys")
  require "user"
  require "configuration"
  require "ui"


  -- {{{ Menu
  -- Create a launcher widget and a main menu
  myawesomemenu = {
     { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
     { "manual", terminal .. " -e man awesome" },
     { "edit config", editor_cmd .. " " .. awesome.conffile },
     { "restart", awesome.restart },
     { "quit", function() awesome.quit() end },
  }

  mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                      { "open terminal", terminal }
                                    }
                          })

  mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                       menu = mymainmenu })

  menubar.utils.terminal = terminal -- Set the terminal for applications that require it

  awful.spawn.with_shell("/home/lucasbno/.config/awesome/autorun.sh")
