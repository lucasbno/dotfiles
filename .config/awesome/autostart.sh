#!/bin/bash

nitrogen --restore &
# if ! pgrep -x pipewire > /dev/null; then
#     pipewire &
#     pipewire-pulse &
# fi
# pkill -x pipewire
# pkill -x pipewire-pulse
# pipewire &
# pipewire-pulse &
xset r rate 220 40 &
xmodmap ~/.Xmodmap &
xcape -e 'Hyper_L=Escape' -t 100 &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# picom &
xinput set-prop 'pointer:Compx VXE NordicMouse 1K Dongle' 'libinput Accel Profile Enabled' 0 1 &
xinput set-prop 'pointer:Compx VXE NordicMouse 1K Dongle' 'libinput Accel Speed' 0.7
