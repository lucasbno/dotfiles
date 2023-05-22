pcall(require, "luarocks.loader")

-- Standard awesome library
require("config.errors")
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

awful.rules.rules = {
  {

    rule = { class = "firefox" },

  },
  properties = { tag = '3', floating = true }
}
awful.spawn.with_shell("~/.config/awesome/autorun.sh")
