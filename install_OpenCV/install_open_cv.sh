#!/bin/bash

set -e

# Colors for terminal output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

trap 'echo -e "${RED}Installation failed!${NC}"' ERR

echo -e "${GREEN}Installing OpenCV on Raspberry Pi 5...${NC}"

# Update and upgrade the system
sudo apt update
sudo apt upgrade -y

# Install system dependencies (required by OpenCV)
sudo apt install -y python3-dev python3-numpy \
    libjpeg-dev libtiff-dev libpng-dev \
    libavcodec-dev libavformat-dev libswscale-dev \
    libv4l-dev libxvidcore-dev libx264-dev \
    libgtk-3-dev libatlas-base-dev gfortran

# Upgrade pip inside the virtual environment (no sudo)
pip install --upgrade pip

# Install OpenCV from PyPI inside venv
pip install opencv-python opencv-contrib-python

# Verify installation
python3 -c "import cv2; print('OpenCV version:', cv2.__version__)"

echo -e "${GREEN}OpenCV installed successfully.${NC}"
