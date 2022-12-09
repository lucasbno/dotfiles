terminal = "alacritty"
explorer = "ranger"
browser = "firefox"
launcher = "rofi - show drun"
editor = os.getenv("EDITOR") or "nvim"
visual_editor = "codium"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"