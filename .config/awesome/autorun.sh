#!/bin/bash

nitrogen --restore &
xset r rate 220 40 &
# xmodmap ~/.Xmodmap &
picom &
xinput --set-prop 10 'libinput Accel Speed' 0.9 &
xinput --set-prop 10 'libinput Accel Profile Enabled' 0, 1 &
