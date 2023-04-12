pcall(require, "luarocks.loader")

-- Standard awesome library
gears = require("gears")
awful = require("awful")
beautiful = require("beautiful")
beautiful.init('~/.config/awesome/theme.lua')
keys = require("config.keys")
bling = require("bling")
local naughty = require("naughty")


modkey = "Mod4"

require "user"
require "config"
require("awful.autofocus")
require "bar"
require("awful.hotkeys_popup.keys")
require "menu"
require "wallpaper"

awful.mouse.append_global_mousebindings {
  awful.button({}, 9, awful.tag.history.restore),
}

awful.spawn.with_shell("~/.config/awesome/autorun.sh")
