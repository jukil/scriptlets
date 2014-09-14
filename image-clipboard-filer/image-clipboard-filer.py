#!/usr/bin/python
"""
Save image from clipboard to file
"""

import sys
import glob
from optparse import OptionParser

def def_file():
    """
    Return default file name
    """
    files = glob.glob("img???.png")
    if len(files) < 1:
        return 'img001.png'
    maxf = 0
    for f in files:
        try:
            n = int(f[3:6])
            maxf = max(n, maxf)
        except ValueError:
            pass
    return 'img{:03d}.png'.format(maxf+1)


usage = """%prog [option] [filename]
Save image from clipboard to file in PNG format."""

op = OptionParser(usage=usage)
op.add_option("-o", "--open", action="store_true", dest="open", default=False, 
        help="Open saved file with default program (using xdg-open)")
(options, args) = op.parse_args()

if len(args) > 1:
    parser.error("Only one argument expected")
    sys.exit(1)
elif len(args) == 1:
    fname = args[0]
else:
    fname = def_file()

import gtk
clipboard = gtk.clipboard_get()
image = clipboard.wait_for_image()
if image is not None:
    image.save(fname, "png")
    print "PNG image saved to file", fname
    if options.open:
        import subprocess
        subprocess.call(["xdg-open", fname])
else:
    print "No image in clipboard found"
