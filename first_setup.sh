#!/bin/bash

# Exit if any command fails
set -e 

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Error trap
trap 'echo -e "${RED}Something went wrong! Exiting.${NC}"' ERR

# Save script location
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Go to your project directory (instead of home, for venv location)
cd "$SCRIPT_DIR"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
source ~venv/bin/activate

# Upgrade pip inside venv
pip install --upgrade pip

# Start timer
SECONDS=0  

###########################################################################

# Install OpenCV if needed
if ! python3 -c "import cv2" &> /dev/null; then
    echo "OpenCV not found. Installing..."
    chmod +x "$SCRIPT_DIR/install_open_cv.sh"
    "$SCRIPT_DIR/install_open_cv.sh"
else
    echo "OpenCV is already installed. Skipping."
fi

# Install PyTorch if needed
if ! python3 -c "import torch" &> /dev/null; then
    echo "PyTorch not found. Installing..."
    chmod +x "$SCRIPT_DIR/install_pytorch.sh"
    "$SCRIPT_DIR/install_pytorch.sh"
else
    echo "PyTorch is already installed. Skipping."
fi

# Install DepthAI if needed
if ! python3 -c "import depthai" &> /dev/null; then
    echo "DepthAI not found. Installing..."
    chmod +x "$SCRIPT_DIR/install_depthai.sh"
    "$SCRIPT_DIR/install_depthai.sh"
else
    echo "DepthAI is already installed. Skipping."
fi

# Install voice playback tools using apt (system-wide)
sudo apt update
sudo apt install -y mpg123 espeak

# Install Python packages inside venv (no sudo here)
pip install pyttsx3 gTTS requests

###########################################################################

# Print installation time
duration=$SECONDS
printf "${GREEN}Installation completed in %02d:%02d:%02d (hh:mm:ss).${NC}\n" \
    $(($duration / 3600)) $(($duration % 3600 / 60)) $(($duration % 60))
