#!/bin/bash

# This script installs Miniforge and SageMath in a new Conda environment.
# After installation, use 'conda activate sage' to start using SageMath.

MINIFORGE_INSTALL_DIR="/opt/miniforge3"
PROFILE_PATH="/etc/profile"

# Check if Conda is installed
if [ ! -f "${MINIFORGE_INSTALL_DIR}/bin/conda" ]; then
    echo "Installing Miniforge to ${MINIFORGE_INSTALL_DIR}..."

    # Download Miniforge installer
    INSTALLER="Miniforge3-$(uname)-$(uname -m).sh"
    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/${INSTALLER}"

    # Install Miniforge
    bash "${INSTALLER}" -b -p "${MINIFORGE_INSTALL_DIR}"
    rm "${INSTALLER}"

    # Add Miniforge to PATH in /etc/profile to ensure it's available in all sessions
    echo "export PATH=\"${MINIFORGE_INSTALL_DIR}/bin:\$PATH\"" >> "${PROFILE_PATH}"

    # Reload /etc/profile to update PATH
    source "${PROFILE_PATH}"
else
    echo "Miniforge is already installed."
fi

# Configure Conda for all users
"${MINIFORGE_INSTALL_DIR}/bin/conda" init bash

# Use Conda to install SageMath in a new environment
PYTHON_VERSION="3.9"
echo "Creating a SageMath environment with Python ${PYTHON_VERSION}..."
if [ -f "${MINIFORGE_INSTALL_DIR}/bin/mamba" ]; then
    "${MINIFORGE_INSTALL_DIR}/bin/mamba" create -n sage sage python="${PYTHON_VERSION}" -y
else
    "${MINIFORGE_INSTALL_DIR}/bin/conda" create -n sage sage python="${PYTHON_VERSION}" -y
fi

echo "Installation complete. Use 'conda activate sage' to start using SageMath."