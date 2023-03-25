local menu = {
  { "Refresh",  awesome.restart },
  { "Logout",   function() awesome.quit() end },
  { "Restart",  function() awful.spawn.with_shell('reboot') end },
  { "Shutdown", function() awful.spawn.with_shell('poweroff') end },
}

local main = awful.menu {
  items = {
    {
      "Awesome",
      menu,
    },
    { "Terminal", "alacritty" },
    { "Browser",  "firefox" },
    { "Editor",   "alacritty -e nvim" },
    { "Music",    "alacritty -e ncmpcpp" },
    { "Files",    "alacritty -e lf" },
  }
}

root.buttons(gears.table.join(
  awful.button({}, 3, function() main:toggle() end)
))
