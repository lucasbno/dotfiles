#!/bin/bash

# $HOME/.config/awesome/scripts/redshift &
nitrogen --restore &
xset r rate 220 40 &
xmodmap ~/.Xmodmap &
xcape -e 'Hyper_L=Escape' -t 100 &
# $HOME/.config/awesome/scripts/audio &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# picom &
xinput set-prop 'Logitech G403 Prodigy Gaming Mouse' 'libinput Accel Profile Enabled' 0 1 &
xinput set prop 'Logitech G403 Prodigy Gaming Mouse' 'libinput Accel Speed' 0.7
