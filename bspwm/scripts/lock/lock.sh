#!/usr/bin/env bash

scrot /tmp/screen.png
convert /tmp/screen.png -blur 12x4 /tmp/screen.png
[[ -f ~/.config/bspwm/scripts/lock/lock.png ]] && convert /tmp/screen.png  ~/.config/bspwm/scripts/lock/lock.png -gravity center -composite -matte /tmp/screen.png
i3lock -e -u -i /tmp/screen.png
