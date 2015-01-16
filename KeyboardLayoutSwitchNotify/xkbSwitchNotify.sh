#!/bin/bash

## Dependencies
# xkb-switch
# libnotify

# Switch to next keyboard layout
xkb-switch -n
LAYOUT=$(xkb-switch)

notify-send -i warning "Keyboard Layout" "Keyboard layout switched to ${LAYOUT}" --icon=input-keyboard
