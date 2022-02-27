#!/bin/bash
set -e # exit when any error occurs

# Install dependencies

install_dir="/usr/local"

echo "=========================="
echo "Installing OpenBLAS to $install_dir"
echo "=========================="

cd "$install_dir"
sudo mkdir -p openblas-installation src
cd src
sudo wget https://github.com/xianyi/OpenBLAS/releases/download/v0.3.17/OpenBLAS-0.3.17.tar.gz
sudo tar -xvzf OpenBLAS-0.3.17.tar.gz
sudo rm OpenBLAS-0.3.17.tar.gz
cd OpenBLAS-0.3.17

# Change to 'sudo make -j{cores}' to build in parallel
sudo make -j4

sudo make PREFIX="$install_dir/openblas-installation" install

# A correct installation of OpenBLAS will contain files in the lib directory
if [ -z "$(ls -A ../../openblas-installation/lib)" ]; then
    echo "OpenBLAS did not install correctly, directory $install_dir/openblas-installation/lib is empty."
    exit 1
else
    echo "============================="
    echo "OpenBLAS installed correctly."
    echo "============================="
fi
