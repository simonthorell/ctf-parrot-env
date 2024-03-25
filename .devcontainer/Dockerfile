#==============================================================================
# OS & Base Packages
#==============================================================================
# Headless Parrot Security OS (Linux Debian) with security tools pre-installed
# (https://parrotsec.org/docs/cloud/parrot-on-docker/#parrotsecsecurity)
FROM parrotsec/security

# Password for X11 VNC server (change to your desired password!)
ENV VNC_PASSWORD=parrot

# Set noninteractive to avoid interactive dialog during build
ARG DEBIAN_FRONTEND=noninteractive

#==============================================================================
# Download & Install Applications (run first for caching efficiency)
#==============================================================================
# Install Ghidra (Update to latest version available on GitHub)
# Requires Java 11 (openjdk-17-jdk) to be installed (apt-get install)
ARG GHIDRA_VERSION=11.0.1
ARG GHIDRA_RELDATE=20240130
ENV GHIDRA_ZIP Ghidra_${GHIDRA_VERSION}_build/ghidra_${GHIDRA_VERSION}_PUBLIC_${GHIDRA_RELDATE}.zip
ENV GHIDRA_URL https://github.com/NationalSecurityAgency/ghidra/releases/download/${GHIDRA_ZIP}

RUN wget $GHIDRA_URL -O /tmp/ghidra.zip \
    && unzip /tmp/ghidra.zip -d /opt \
    && rm /tmp/ghidra.zip \
    # Create a script in bin to use "ghidraRun" command anywhere
    && echo "#!/bin/bash\n/opt/ghidra_11.0.1_PUBLIC/ghidraRun \"\$@\"" > /bin/ghidraRun \
    && chmod +x /bin/ghidraRun

#==============================================================================
# Update & Install Container Tools
#==============================================================================
RUN apt-get update && apt-get install -y \
    git \
    curl \
    openjdk-17-jdk \
    tigervnc-standalone-server \
    x11-apps \
    fluxbox \
    xauth \
    xvfb \
    wireshark \
    # Clear cache
    && rm -rf /var/lib/apt/lists/*

# General tools:    git, curl
# Java 11:          openjdk-17-jdk (required for Ghidra)
# VNC Server:       tigervnc, x11-apps, fluxbox
# Wireshark:        xauth, xvfb, wireshark

#==============================================================================
# Python Dependencies
#==============================================================================
# Download get-pip.py script and install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# Install python packages with pip
RUN pip install pwntools \
    angr \
    pycryptodome \
    z3-solver \
    binwalk \
    scapy \
    impacket \
    requests \
    beautifulsoup4 \
    selenium \
    capstone \
    volatility3 \
    ropgadget \
    sqlalchemy \
    ghidra_bridge \
    # Clear cache
    && rm -rf /root/.cache/pip

#==============================================================================
# VNC Server & GUI Forwarding using X11 + Fluxbox (Window Manager)
#==============================================================================
# Use netcat on client to confirm the port is open: 'nc -zv localhost 5901'
RUN mkdir /root/.vnc
RUN echo $VNC_PASSWORD | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
EXPOSE 5901

#==============================================================================
# Wireshark Specific Setup (Can be replaced with script?)
#==============================================================================
# Set the display env var
ENV XDG_RUNTIME_DIR=/tmp/runtime-root
# Ensure the directory exists and is writable by any user
RUN mkdir -p $XDG_RUNTIME_DIR && chmod 777 $XDG_RUNTIME_DIR