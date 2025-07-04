pcall(require, "luarocks.loader")

require("config.errors")
gears = require("gears")
awful = require("awful")
beautiful = require("beautiful")
beautiful.init('~/.config/awesome/theme.lua')
keys = require("config.keys")
bling = require("bling")

modkey = "Mod4"

require "user"
require "config"
require("awful.autofocus")
require "bar"
require("awful.hotkeys_popup.keys")
require "menu"
require "wallpaper"

awful.spawn.with_shell("~/.config/awesome/autorun.sh")
