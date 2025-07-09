---@diagnostic disable:undefined-global

local gears = require 'gears'
local wibox = require 'wibox'
local awful = require 'awful'
local beautiful = require 'beautiful'
local dpi = beautiful.xresources.apply_dpi

local helpers = {}

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

function helpers.add_hover(element, bg, hbg)
    element:connect_signal('mouse::enter', function (self)
        self.bg = hbg
    end)
    element:connect_signal('mouse::leave', function (self)
        self.bg = bg
    end)
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

function helpers.view_nonempty(i, screen)
        screen = screen or awful.screen.focused()
        local tags = screen.tags
        local showntags = {}
        for _, t in ipairs(tags) do
                if not awful.tag.getproperty(t, "hide") then
                        table.insert(showntags, t)
                end
        end
        local sel = screen.selected_tag
        local t = gears.table.cycle_value(showntags, sel, nil, function(t)
                return #t:clients() > 0
        end)
        if t then
                awful.tag.viewnone(screen)
                t.selected = true
                screen:emit_signal("tag::history::update")
        end
end

return helpers
