pcall(require, "luarocks.loader")

-- Standard awesome library
gears = require("gears")
awful = require("awful")
beautiful = require("beautiful")
beautiful.init('~/.config/awesome/theme.lua')
keys = require("config.keys")
local naughty = require("naughty")

require "user"
require "config"
require("awful.autofocus")
require "bar"
require("awful.hotkeys_popup.keys")
require "menu"
require "wallpaper"

awful.spawn.with_shell("~/.config/awesome/autorun.sh")
