#!/bin/sh
numlockx
setxkbmap -option '' -option 'caps:swapescape' -option 'grp:win_space_toggle' -option 'grp_led:scroll' -layout 'us,tr'
xinput --set-prop 'Logitech Gaming Mouse G300' 'libinput Accel Profile Enabled' 0, 1

/home/fethbita/.startup_scripts/.screenlayout/mono.sh
