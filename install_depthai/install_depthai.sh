#!/bin/bash

# Exit if any command fails
set -e

# Upgrade pip inside virtual environment (no sudo)
pip install --upgrade pip

# Install DepthAI Python package inside virtual environment
pip install depthai

# Set permissions for OAK-D Lite USB device (requires sudo)
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="03e7", MODE="0666"' | sudo tee /etc/udev/rules.d/80-movidius.rules
sudo udevadm control --reload-rules && sudo udevadm trigger

# (OPTIONAL) Verify installation
python3 -c "import depthai; print('DepthAI version:', depthai.__version__)"
python3 -c "import depthai; print('Available devices:', depthai.Device.getAllAvailableDevices())"

echo "DepthAI installation and verification complete."
