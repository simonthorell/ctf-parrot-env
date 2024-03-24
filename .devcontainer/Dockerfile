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

# Download get-pip.py script and install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# Install python packages
RUN pip install pwntools \
    # Clear cache
    && rm -rf /root/.cache/pip