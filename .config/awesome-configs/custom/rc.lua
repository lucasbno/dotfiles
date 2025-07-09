pcall(require, "luarocks.loader")

require("config.errors")
gears = require("gears")
awful = require("awful")
beautiful = require("beautiful")

local config_file = io.open(os.getenv("HOME") .. "/.config/awesome-configs/custom/current-config", "r")
local config_mode = "normal"
if config_file then
    config_mode = config_file:read("*line"):gsub("%s+", "") -- trim whitespace
    config_file:close()
end

if config_mode == "minimal" then
    beautiful.init('~/.config/awesome-configs/custom/theme/minimal.lua')
else
    beautiful.init('~/.config/awesome-configs/custom/theme/normal.lua')
end

bling = require("bling")
require "user"
require "config"
require("awful.autofocus")
require "menu"

if config_mode == "minimal" then
    require "bar.minimal"
else
    require "bar"
end



awful.spawn.with_shell("~/.config/awesome/autostart.sh")