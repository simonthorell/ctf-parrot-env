# Get the base image (https://parrotsec.org/docs/cloud/parrot-on-docker/#parrotsecsecurity)
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
# INSTALL CUSTOM APPS & DEPENDENCIES
###############################################################################

# Download get-pip.py script and install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# Install python packages
RUN pip install pwntools \
    # Clear cache
    && rm -rf /root/.cache/pip

# Install GUI applications
# ...here... (For example Ghidra, IDA Pro, etc.)

###############################################################################
# INSTALL VNC SERVER & FLUXBOX 
###############################################################################
# You will need to install a VNC client (such as realVNC) on your local machine 
# to connect to the VNC server and view any GUI applications running in the
# headless Linux OS inside the Docker Container.

# Install VNC server & fluxbox (window manager) to remote display GUI apps
RUN apt-get update && apt-get install -y \
    tightvncserver \
    x11-apps \
    fluxbox \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.vnc

# Replace "your_vnc_password" with your desired VNC password
RUN echo "your_vnc_password" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

EXPOSE 5901 
# Use netcat to confirm that the port is open: nc -zv localhost 5901

# Install locales and generate en_US.UTF-8 (Required for tightvncserver)
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get install -y \
    xfonts-base \
    xfonts-scalable \
    xfonts-75dpi \
    xfonts-100dpi \
    && rm -rf /var/lib/apt/lists/*

# Open realVNC and connect to localhost:5901
# Inside the terminal in VSCode, type "xeyes" to check that GUI application is working over VNC