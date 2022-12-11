  pcall(require, "luarocks.loader")

  local gears = require("gears")
  local awful = require("awful")
  local beautiful = require("beautiful")
  local menubar = require("menubar")

  require("awful.autofocus")
  beautiful.init("/home/lucasbno/.config/awesome/theme.lua")
  require("awful.hotkeys_popup.keys")
  require "user"
  require "configuration"
  require "ui"

  awful.spawn.with_shell("/home/lucasbno/.config/awesome/autorun.sh")
