#!/bin/bash

# Dependencies:
# libnotify
# copyq
# maim
# slop

notify-send -i warning "Taking Screenshot" "Please select your area" --icon=camera-photo
maim -s -c 1,0,0,0.6 -p 10 -d 5 /tmp/screenshot.png
copyq write image/png - < /tmp/screenshot.png
copyq select 0
notify-send -i warning "Taking Screenshot" "Screenshot copied to clipboard" --icon=camera-photo
