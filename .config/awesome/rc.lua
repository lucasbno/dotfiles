  pcall(require, "luarocks.loader")

  local gears = require("gears")
  local awful = require("awful")
  local beautiful = require("beautiful")

  require("awful.autofocus")
  beautiful.init("/home/lucasbno/.config/awesome/theme.lua")
  require("awful.hotkeys_popup.keys")
  require "user"
  require "configuration"
  require "ui"

  mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

  awful.spawn.with_shell("/home/lucasbno/.config/awesome/autorun.sh")
