#!/bin/bash
export USER=root
export DISPLAY=:1

# Start VNC server
vncserver :1 -geometry 1280x720 -depth 24 -fp /usr/share/fonts/X11/misc,/usr/share/fonts/X11/Type1

# Echo user message & instructions
echo -e "\033[1;32mVNC server successfully started on port 5901!\033[0m\n"
echo "Download RealVNC Lite Viewer: https://www.realvnc.com/en/connect/plan/lite/"
echo "Connect to the VNC server on port 5901"
echo "Login using the password defined in .devcontainer/Dockerfile"

# Start fluxbox with suppressed output
fluxbox > /dev/null 2>&1 &

# Keep the container running
tail -f /dev/null