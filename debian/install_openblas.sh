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

sudo make PREFIX="${install_dir}/openblas-installation" install

# A correct installation of OpenBLAS will contain the lib directory
DIR="${install_dir}/openblas-installation/lib"
if [ -d "$DIR" ]; then
    echo "============================="
    echo "OpenBLAS installed correctly."
    echo "============================="
else
    echo "========================================================="
    echo "OpenBLAS did not install correctly, ${DIR} does not exist"
    echo "========================================================="
fi
