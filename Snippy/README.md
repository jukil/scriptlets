# Snippy

Based on ["snippy"]((https://bbs.archlinux.org/viewtopic.php?id=71938)) by "sessy".

You will also need "dmenu", "xsel" and "xdotool". Get them from your linux distribution in the usual way. 

## Usage

1. Create the directory ~/.snippy
2. Create a file in that directory for each snippet that you want. The filename will be used as a menu item, so you might want to omit the file extension when you name the file.

    **TIP: If you have a lot of snippets, you can organise them into subdirectories under ~/.snippy.**

    **TIP: The contents of the file will be pasted as is, so if you don't want a newline at the end when the text is pasted, don't put one in the file.**

3. Bind a convenient key combination to this script.

    **TIP: If you're using XMonad, add something like this to xmonad.hs ((mod4Mask, xK_s), spawn "/path/to/snippy")**
