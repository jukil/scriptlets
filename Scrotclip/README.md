# Introduction
A simple Bash wrapper for [maim](https://github.com/naelstrof/maim) screenshot taking tool. It uses libnotify notification to ask
the user for the selected, screenshot area, waits 5 seconds before taking the screenshot, and automatically copies the 
screenshot to the clipboard for quick post-processing.

# Dependencies
* [maim](https://github.com/naelstrof/maim)
* [slop](https://github.com/naelstrof/slop)
* [libnotify](https://developer.gnome.org/notification-spec/)
* [copyq](https://github.com/hluk/CopyQ)

# Installation
Simply copy `scrotlip.sh` to a place somewhere on your path such as `/usr/local/bin`. Arch Linux users can install the script
from the AUR using the [scrotclip](https://aur.archlinux.org/packages/scrotclip-git) package.