#!/bin/bash

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Install general development tools and dependencies
sudo apt install -y \
    build-essential \
    cmake \
    git \
    libmbedtls-dev \
    libasound2-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavfilter-dev \
    libavformat-dev \
    libavutil-dev \
    libcurl4-openssl-dev \
    libfdk-aac-dev \
    libfontconfig-dev \
    libfreetype6-dev \
    libgl1-mesa-dev \
    libjack-jackd2-dev \
    libjansson-dev \
    libluajit-5.1-dev \
    libpulse-dev \
    libqt5x11extras5-dev \
    libspeexdsp-dev \
    libswresample-dev \
    libswscale-dev \
    libudev-dev \
    libv4l-dev \
    libvlc-dev \
    libx11-dev \
    libx264-dev \
    libxcb-shm0-dev \
    libxcb-xinerama0-dev \
    libxcomposite-dev \
    libxinerama-dev \
    pkg-config \
    python3-dev \
    qtbase5-dev \
    libqt5svg5-dev \
    swig \
    libxcb-randr0-dev \
    libxcb-xfixes0-dev \
    libx11-xcb-dev \
    libxcb1-dev

# Optional: install Python tools
sudo apt install -y python3-pip python3-venv

# Optional: install DepthAI dependencies
python3 -m pip install -U pip setuptools
python3 -m pip install depthai opencv-python

# Reboot
echo "Setup complete. Rebooting in 10 seconds..."
sleep 10
sudo reboot
