---@diagnostic disable:undefined-global

local gears = require 'gears'
local wibox = require 'wibox'
local awful = require 'awful'
local beautiful = require 'beautiful'
local dpi = beautiful.xresources.apply_dpi

local helpers = {}

function helpers.get_colorized_markup(content, fg)
    fg = fg or beautiful.blue
    content = content or ''

    return '<span foreground="' .. fg .. '">' .. content .. '</span>'
end

function helpers.add_hover(element, bg, hbg)
    element:connect_signal('mouse::enter', function (self)
        self.bg = hbg
    end)
    element:connect_signal('mouse::leave', function (self)
        self.bg = bg
    end)
end

function helpers.mkroundedrect(radius)
    radius = radius or dpi(7)
    return function (cr, w, h)
        return gears.shape.rounded_rect(cr, w, h, radius)
    end
end

function helpers.mkbtn(template, bg, hbg, radius)
    local button = wibox.widget {
        {
            template,
            margins = dpi(7),
            widget = wibox.container.margin,
        },
        bg = bg,
        widget = wibox.container.background,
        shape = helpers.mkroundedrect(radius),
    }

    if bg and hbg then
        helpers.add_hover(button, bg, hbg)
    end

    return button
end

function helpers.add_buttons(widget, buttons)
    for _, button in ipairs(buttons) do
        widget:add_button(button)
    end
end

function helpers.trim(input)
    local result = input:gsub("%s+", "")
    return string.gsub(result, "%s+", "")
end

function helpers.mkroundedcontainer(template, bg)
    return wibox.widget {
        template,
        shape = helpers.mkroundedrect(),
        bg = bg,
        widget = wibox.container.background,
    }
end

function helpers.make_popup_tooltip(text, placement)
    local ret = {}

    ret.widget = wibox.widget {
        {
            {
                id = 'image',
                image = beautiful.hints_icon,
                forced_height = dpi(12),
                forced_width = dpi(12),
                halign = 'center',
                valign = 'center',
                widget = wibox.widget.imagebox,
            },
            {
                id = 'text',
                markup = text or '',
                align = 'center',
                widget = wibox.widget.textbox,
            },
            spacing = dpi(7),
            layout = wibox.layout.fixed.horizontal,
        },
        margins = dpi(12),
        widget = wibox.container.margin,
        set_text = function (self, t)
            self:get_children_by_id('text')[1].markup = t
        end,
        set_image = function (self, i)
            self:get_children_by_id('image')[1].image = i
        end
    }

    ret.popup = awful.popup {
        visible = false,
        shape = helpers.mkroundedrect(),
        bg = beautiful.bg_normal .. '00',
        fg = beautiful.fg_normal,
        ontop = true,
        placement = placement or awful.placement.centered,
        screen = awful.screen.focused(),
        widget = helpers.mkroundedcontainer(ret.widget, beautiful.bg_normal),
    }

    local self = ret.popup

    function ret.show()
        self.screen = awful.screen.focused()
        self.visible = true
    end

    function ret.hide()
        self.visible = false
    end

    function ret.toggle()
        if not self.visible and self.screen ~= awful.screen.focused() then
            self.screen = awful.screen.focused()
        end
        self.visible = not self.visible
    end

    function ret.attach_to_object(object)
        object:connect_signal('mouse::enter', ret.show)
        object:connect_signal('mouse::leave', ret.hide)
    end

    return ret
end

function helpers.capitalize (txt)
    return string.upper(string.sub(txt, 1, 1))
        .. string.sub(txt, 2, #txt)
end

function helpers.complex_capitalizing (s)
    local r, i = '', 0
    for w in s:gsub('-', ' '):gmatch('%S+') do
        local cs = helpers.capitalize(w)
        if i == 0 then
            r = cs
        else
            r = r .. ' ' .. cs
        end
        i = i + 1
    end

    return r
end

function helpers.limit_by_length (str, max_length, use_pango)
    local sufix = ''
    local toput = '...'

    if #str > max_length - #toput then
        str = string.sub(str, 1, max_length - 3)
        sufix = toput
    end

    if use_pango and sufix == toput then
        sufix = helpers.get_colorized_markup(sufix, beautiful.light_black)
    end

    return str .. sufix
end

function helpers.apply_margin(widget, margins, top, bottom, right, left)
    return wibox.widget {
        widget,
        margins = margins,
        left = left,
        right = right,
        top = top,
        bottom = bottom,
        widget = wibox.container.margin,
    }
end

function helpers.smart_terminal(terminal_cmd, terminal_class)
    terminal_cmd = terminal_cmd or "alacritty"
    terminal_class = terminal_class or "Alacritty"
    
    local screen = awful.screen.focused()
    local tag = screen.selected_tag
    
    for _, c in ipairs(tag:clients()) do
        if awful.rules.match(c, { class = terminal_class }) then
            client.focus = c
            c:raise()
            return
        end
    end
    
    for _, t in ipairs(screen.tags) do
        for _, c in ipairs(t:clients()) do
            if awful.rules.match(c, { class = terminal_class }) then
                c:move_to_tag(tag)
                client.focus = c
                c:raise()
                return
            end
        end
    end
    
    for _, c in ipairs(client.get()) do
        if awful.rules.match(c, { class = terminal_class }) and c.screen ~= screen then
            c:move_to_tag(tag)
            client.focus = c
            c:raise()
            return
        end
    end
    
    awful.spawn(terminal_cmd)
end

return helpers
