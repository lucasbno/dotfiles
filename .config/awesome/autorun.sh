#!/bin/bash

# $HOME/.config/awesome/scripts/redshift &
# nitrogen --restore &
xset r rate 220 40 &
xmodmap ~/.Xmodmap &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom --config ~/.config/picom/picom-jonaburg.conf &
xinput set-prop 'Logitech G403 Prodigy Gaming Mouse' 'libinput Accel Profile Enabled' 0 1 &
xinput set prop 'Logitech G403 Prodigy Gaming Mouse' 'libinput Accel Speed' 0.7
