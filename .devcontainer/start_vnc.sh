#!/bin/bash
export USER=root
export DISPLAY=:1

# Start VNC server
vncserver :1 -geometry 1280x720 -depth 24 -fp /usr/share/fonts/X11/misc,/usr/share/fonts/X11/Type1

# Start fluxbox
fluxbox &

# Keep the container running
tail -f /dev/null