#!/usr/bin/env bash

dir="$HOME/.config/rofi/powermenu"
rofi_command="rofi -theme $dir/theme.rasi"

# Options
shutdown="⏻"
reboot=""
logout=""
suspend=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -i)"
case $chosen in
    $shutdown)
			poweroff;;
    $reboot)
			reboot;;
    $logout)
				logout;;
    $suspend)
				systemctl suspend;;
esac
