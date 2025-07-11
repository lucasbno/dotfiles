local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local awful = require("awful")
local gears = require("gears")

local dpi = beautiful.xresources.apply_dpi

local layouts = {
    { name = "US", cmd = "setxkbmap us && xmodmap ~/.Xmodmap" },
    { name = "BR", cmd = "setxkbmap us intl && xmodmap ~/.Xmodmap" }
}

local current_layout = 1

local keyboard_widget = wibox.widget {
    markup = layouts[current_layout].name,
    align = "center",
    valign = "center",
    font = beautiful.font,
    widget = wibox.widget.textbox
}

local keyboard_background = wibox.widget {
    {
        keyboard_widget,
        left = dpi(10),
        right = dpi(10),
        top = dpi(6),
        bottom = dpi(6),
        widget = wibox.container.margin
    },
    bg = beautiful.blue,
    fg = beautiful.black,
    shape = helpers.mkroundedrect(dpi(4)),
    widget = wibox.container.background
}

local keyboard_container = wibox.widget {
    keyboard_background,
    left = dpi(4),
    right = dpi(4),
    top = dpi(2),
    bottom = dpi(2),
    forced_width = dpi(70),
    widget = wibox.container.margin
}

local function update_layout()
    local layout = layouts[current_layout]
    keyboard_widget:set_markup(layout.name)
    
    awful.spawn.with_shell(layout.cmd)
end

local function next_layout()
    current_layout = current_layout % #layouts + 1
    update_layout()
end

keyboard_container:add_button(awful.button({}, 1, function()
    next_layout()
end))

helpers.add_hover(keyboard_background, beautiful.blue, beautiful.cyan)

update_layout()

return keyboard_container