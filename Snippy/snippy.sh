#!/bin/bash
#
# Based on "snippy" by "sessy" 
# (https://bbs.archlinux.org/viewtopic.php?id=71938)
#
# You will also need "dmenu" and "copyq". Get them from your linux
# distro in the usual way.
#
# To use:
# 1. Create the directory ~/.snippy
#
# 2. Create a file in that directory for each snippet that you want.
#    The filename will be used as a menu item, so you might want to
#    omit the file extension when you name the file. 
#
#    TIP: If you have a lot of snippets, you can organise them into 
#    subdirectories under ~/.snippy.
#
#    TIP: The contents of the file will be pasted asis, so if you 
#    don't want a newline at the end when the text is pasted, don't
#    put one in the file.
#
# 3. Bind a convenient key combination to this script.
#
#    TIP: If you're using XMonad, add something like this to xmonad.hs
#      ((mod4Mask, xK_s), spawn "/path/to/snippy")
#
DIR=${HOME}/.snippy
DMENU_ARGS="-b"

cd ${DIR}

# Use the filenames in the snippy directory as menu entries.
# Get the menu selection from the user.
FILE=`find .  -type f | grep -v '^\.$' | sed 's!\.\/!!' | /usr/bin/dmenu ${DMENU_ARGS}`

if [ -f ${DIR}/${FILE} ]; then
  # Put the contents of the selected file into the paste buffer.
  copyq write text/plain - < ${DIR}/${FILE}
  # Paste into the current application.
  copyq select 0
  copyq paste
  # Restore old clipboard content
  copyq select 1
fi