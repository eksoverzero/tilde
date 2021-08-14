#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar if you are on ArcoLinuxD
# awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar --reload mainbar-i3 -c ~/.config/polybar/config &

# LAYOUT=$(autorandr | grep " (detected)" | cut -d" " -f1)
# PRIMARY_MONITOR=DP2

# if [[ $LAYOUT == "docked" ]]; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     if [ $m != $PRIMARY_MONITOR ]; then
#       MONITOR=$m polybar --reload mainbar-i3-extended -c ~/.config/polybar/config &
#     fi
#   done
# fi
