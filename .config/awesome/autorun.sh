#!/bin/bash

nitrogen --restore &
xset r rate 220 40 &
xmodmap ~/.Xmodmap &
picom &
xinput set-prop 'Logitech G403 Prodigy Gaming Mouse' 'libinput Accel Profile Enabled' 0 1 &
xinput set prop 'Logitech G403 Prodigy Gaming Mouse' 'libinput Accel Speed' 0.7
