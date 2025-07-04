---@diagnostic disable: undefined-global

local awful = require 'awful'
local beautiful = require 'beautiful'
local wibox = require 'wibox'
local gears = require 'gears'
local helpers = require 'helpers'
local dpi = beautiful.xresources.apply_dpi

local function get_calendar()
    return awful.screen.focused().calendar
end

awesome.connect_signal('calendar::toggle', function ()
    get_calendar().toggle()
end)

awesome.connect_signal('calendar::visibility', function (v)
    if v then
        get_calendar().show()
    else
        get_calendar().hide()
    end
end)

awful.screen.connect_for_each_screen(function (s)
    s.calendar = {}

    s.calendar.calendar = wibox.widget {
        date = os.date('*t'),
        font = 'Inter 12',
        spacing = dpi(2),
        widget = wibox.widget.calendar.month,
        fn_embed = function (widget, flag, date)
            local focus_widget = wibox.widget {
                text = date.day,
                align = 'center',
                widget = wibox.widget.textbox,
            }

            local torender = flag == 'focus' and focus_widget or widget

            local colors = {
                header = beautiful.blue,
                focus = beautiful.aqua,
                weekday = beautiful.cyan
            }

            local color = colors[flag] or beautiful.fg_normal

            return wibox.widget {
                {
                    torender,
                    margins = dpi(7),
                    widget = wibox.container.margin,
                },
                bg = flag == 'focus' and beautiful.black or beautiful.bg_normal,
                fg = color,
                widget = wibox.container.background,
                shape = flag == 'focus' and gears.shape.circle or nil,
            }
        end
    }

    s.calendar.popup = awful.popup {
        bg = '#00000000',
        fg = beautiful.fg_normal,
        visible = false,
        ontop = true,
        placement = function (d)
            return awful.placement.top_right(d, { margins = {
              top = 50,
              right = 10
            }})
        end,
        shape = helpers.mkroundedrect(),
        screen = s,
        widget = s.calendar.calendar,
        border_width = 1,
        border_color = beautiful.cyan
    }

    local self = s.calendar.popup

    function s.calendar.show ()
        self.visible = true
    end

    function s.calendar.hide()
        self.visible = false
    end

    function s.calendar.toggle ()
        self.visible = not self.visible
    end
end)
