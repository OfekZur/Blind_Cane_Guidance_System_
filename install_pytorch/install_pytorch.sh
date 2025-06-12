#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

trap 'echo -e "${RED}Installation failed!${NC}"' ERR

echo -e "${GREEN}Installing PyTorch and Torchvision inside virtual environment...${NC}"

# Install system dependencies required for PyTorch
sudo apt update
sudo apt install -y libjpeg-dev libopenblas-dev libopenmpi-dev libomp-dev \
    libavcodec-dev libavformat-dev libswscale-dev zlib1g-dev libpython3-dev

# Upgrade pip and setuptools inside venv (no sudo here!)
pip install --upgrade pip setuptools wheel cython

# Install PyTorch and Torchvision (CPU-only)
pip install torch torchvision

# Verify installation
python3 -c "import torch; import torchvision; print(f'PyTorch version: {torch.__version__}'); print(f'Torchvision version: {torchvision.__version__}'); print(f'CUDA available: {torch.cuda.is_available()}')"

echo -e "${GREEN}PyTorch and Torchvision installed successfully.${NC}"
