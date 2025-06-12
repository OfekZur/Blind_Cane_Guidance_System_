#!/bin/bash

# Exit if any command fails
set -e

# Install DepthAI (with pip dependencies)
sudo -H python3 -m pip install --upgrade pip
sudo -H python3 -m pip install depthai

# Set permissions for OAK-D Lite USB device
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="03e7", MODE="0666"' | sudo tee /etc/udev/rules.d/80-movidius.rules
sudo udevadm control --reload-rules && sudo udevadm trigger

# (OPTIONAL) Verify installation
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Verifying installation..."

    python3 -c "import depthai; print('DepthAI version:', depthai.__version__)"
    python3 -c "import depthai; print('Available devices:', depthai.Device.getAllAvailableDevices())"

    echo "Verification complete."
fi

