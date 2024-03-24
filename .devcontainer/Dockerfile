###############################################################################
# OS & BASE PACKAGES
###############################################################################
# Headless Parrot Security OS (Linux Debian) with security tools pre-installed
# (https://parrotsec.org/docs/cloud/parrot-on-docker/#parrotsecsecurity)
FROM parrotsec/security

# Set noninteractive to avoid interactive dialog during build
ARG DEBIAN_FRONTEND=noninteractive

# Install container tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    # Clear cache
    && rm -rf /var/lib/apt/lists/*

###############################################################################
# ADDITIONAL APPS & PACKAGES
###############################################################################
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    xauth \ 
    wireshark \
    # Clear cache
    && rm -rf /var/lib/apt/lists/*

# Download get-pip.py script and install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# Install python packages
RUN pip install pwntools \
    # Add more needed python packages here...
    # Clear cache
    && rm -rf /root/.cache/pip

# Install Ghidra (Update to latest version available)
ENV GHIDRA_VERSION 11.0.1
ENV GHIDRA_RELDATE 20240130
ENV GHIDRA_ZIP Ghidra_${GHIDRA_VERSION}_build/ghidra_${GHIDRA_VERSION}_PUBLIC_${GHIDRA_RELDATE}.zip
ENV GHIDRA_URL https://github.com/NationalSecurityAgency/ghidra/releases/download/${GHIDRA_ZIP}

RUN wget $GHIDRA_URL -O /tmp/ghidra.zip \
    && unzip /tmp/ghidra.zip -d /opt \
    && rm /tmp/ghidra.zip \
    # Create a script in bin to use "ghidraRun" command anywhere
    && echo "#!/bin/bash\n/opt/ghidra_11.0.1_PUBLIC/ghidraRun \"\$@\"" > /bin/ghidraRun \
    && chmod +x /bin/ghidraRun
# Note! Ghidra require openjdk-17-jdk to be installed with apt-get

###############################################################################
# VNC SERVER & FLUXBOX - X11 APP GUI FORWARDING
###############################################################################
# Download & open realVNC Lite and connect to localhost:5901 + password "parrot"
# Inside the terminal in VSCode, type "xeyes" to check that x11 GUI forwarding 
# is working over VNC as we are running headless Linux OS inside container.

# Install VNC server & fluxbox (window manager for headless OS)
RUN apt-get update && apt-get install -y \
    tightvncserver \
    x11-apps \
    fluxbox \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.vnc

# Replace "parrot" with your desired VNC password
RUN echo "parrot" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

# Use netcat on client to confirm the port is open: 'nc -zv localhost 5901'
EXPOSE 5901