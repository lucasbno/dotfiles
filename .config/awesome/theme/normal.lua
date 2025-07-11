---------------------------
-- Default awesome theme --
local xresources = require("beautiful.xresources")
local gears = require "gears"
local gfs = require("gears.filesystem")

local dpi = xresources.apply_dpi

local naughty = require("naughty")
local rnotification = require("ruled.notification")

-- paths
local themes_path = gfs.get_themes_dir()
local assets_path = gfs.get_configuration_dir() .. "assets/"

-- assets
local icons_path = assets_path .. "icons/"
local shapes_path = assets_path .. "shapes/"

local theme = {}

--theme.wallpaper = assets_path .. "/wallpapers/main.jpeg"
theme.font      = "Inter 12"
theme.nerd_font = 'Iosevka Nerd Font 13'
theme.material_icons = 'Material Icons'
theme.font_size = '10'

-- base colors
theme.black = '#151720'
theme.dimblack = '#1a1c25'
theme.light_black = '#262831'
theme.grey = '#666891'
theme.red = '#dd6777'
theme.yellow = '#ecd3a0'
theme.magenta = '#c296eb'
theme.green = '#90ceaa'
theme.blue = '#86aaec'
theme.cyan = '#93cee9'
theme.aqua = '#7bd9e6'

-- backgrounds
theme.bg_normal     = "#191724"
theme.bg_contrast   = "#0f111a"

-- elements bg
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
-- theme.bg_systray    = theme.green

-- foregrounds
theme.fg_normal     = "#a5b6cf"
theme.fg_focus      = theme.fg_nromal
theme.fg_urgent     = theme.red
theme.fg_minimize   = theme.fg_normal

-- some actions bg colors
theme.actions = {
    bg = theme.bg_normal,
    contrast = theme.bg_contrast,
    lighter = theme.bg_lighter,
    fg = theme.fg_normal,
}

theme.useless_gap   = dpi(4)
theme.border_width  = dpi(0)
theme.border_normal = "#00000000"
theme.border_focus  = "#fbff12"
theme.border_marked = "#91231c"

-- systray
theme.systray_icon_spacing = dpi(8)

--taglist
theme.taglist_fg_focus = "#50fa7b"
theme.taglist_font = "Inter 15"

-- layouts
theme.layout_fairh = gears.color.recolor_image(themes_path.."default/layouts/fairhw.png", theme.fg_normal)
theme.layout_fairv = gears.color.recolor_image(themes_path.."default/layouts/fairvw.png", theme.fg_normal)
theme.layout_floating  = gears.color.recolor_image(themes_path.."default/layouts/floatingw.png", theme.fg_normal)
theme.layout_magnifier = gears.color.recolor_image(themes_path.."default/layouts/magnifierw.png", theme.fg_normal)
theme.layout_max = gears.color.recolor_image(themes_path.."default/layouts/maxw.png", theme.fg_normal)
theme.layout_fullscreen = gears.color.recolor_image(themes_path.."default/layouts/fullscreenw.png", theme.fg_normal)
theme.layout_tilebottom = gears.color.recolor_image(themes_path.."default/layouts/tilebottomw.png", theme.fg_normal)
theme.layout_tileleft   = gears.color.recolor_image(themes_path.."default/layouts/tileleftw.png", theme.fg_normal)
theme.layout_tile = gears.color.recolor_image(themes_path.."default/layouts/tilew.png", theme.fg_normal)
theme.layout_tiletop = gears.color.recolor_image(themes_path.."default/layouts/tiletopw.png", theme.fg_normal)
theme.layout_spiral  = gears.color.recolor_image(themes_path.."default/layouts/spiralw.png", theme.fg_normal)
theme.layout_dwindle = gears.color.recolor_image(themes_path.."default/layouts/dwindlew.png", theme.fg_normal)
theme.layout_cornernw = gears.color.recolor_image(themes_path.."default/layouts/cornernww.png", theme.fg_normal)
theme.layout_cornerne = gears.color.recolor_image(themes_path.."default/layouts/cornernew.png", theme.fg_normal)
theme.layout_cornersw = gears.color.recolor_image(themes_path.."default/layouts/cornersww.png", theme.fg_normal)
theme.layout_cornerse = gears.color.recolor_image(themes_path.."default/layouts/cornersew.png", theme.fg_normal)

theme.volume_on = gears.color.recolor_image(icons_path .. 'volume-on.svg', theme.fg_normal)
theme.volume_muted = gears.color.recolor_image(icons_path .. 'volume-muted.svg', theme.fg_normal)

-- fallback notification icon
theme.fallback_notif_icon = gears.color.recolor_image(icons_path .. 'hints.svg', theme.blue)

theme.playerctl_ignore  = "chromium"
theme.playerctl_player  = {"spotify", "%any"}

-- disable icon theme
theme.icon_theme = nil

-- bling tabbed configuration
theme.tabbed_spawn_in_tab = false  -- whether a new client should spawn into the focused tabbing container

theme.tabbar_ontop = false
theme.tabbar_radius = 0                    -- no border radius for minimal look
theme.tabbar_style = "default"             -- default style is more minimal than modern
theme.tabbar_font = "Inter 10"             -- smaller font for slim tabs
theme.tabbar_size = dpi(22)                -- even slimmer for i3wm look
theme.tabbar_position = "top"              -- position of the tabbar

theme.tabbar_bg_focus = "#4C7899"          -- light blue for focused tab (i3wm style)
theme.tabbar_fg_focus = "#FFFFFF"          -- white text on focused tab
theme.tabbar_bg_normal = "#333333"         -- dark grey for unfocused tabs
theme.tabbar_fg_normal = "#BBBBBB"         -- light grey text on unfocused tabs

-- inactive window states (when window loses focus)
theme.tabbar_bg_focus_inactive = "#285577"     -- darker blue when window is unfocused
theme.tabbar_fg_focus_inactive = "#DDDDDD"     -- slightly dimmed white text
theme.tabbar_bg_normal_inactive = "#222222"    -- darker grey for inactive unfocused tabs
theme.tabbar_fg_normal_inactive = "#888888"    -- dimmed grey text

theme.tabbar_disable = false               -- disable the tab bar entirely

  --------------------------
  -- NAUGHTY CONFIGURATION
  --------------------------
  naughty.config.defaults.ontop = true
  naughty.config.defaults.icon_size = dpi(32)
  naughty.config.defaults.timeout = 10
  naughty.config.defaults.hover_timeout = 300
  naughty.config.defaults.title = 'System Notification Title'
  naughty.config.defaults.margin = dpi(16)
  naughty.config.defaults.border_width = 0
  naughty.config.defaults.position = 'top_right'
  -- naughty.config.defaults.border_width = '1'
  naughty.config.defaults.border_color = theme.cyan
  naughty.config.padding = dpi(8)
  naughty.config.spacing = dpi(8)

  -- naughty.config.defaults.shape = function(cr, w, h)
  --   gears.shape.rounded_rect(cr, w, h, dpi(6))
  -- end

return theme