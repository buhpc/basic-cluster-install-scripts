#!/bin/bash
set -e # exit when any error occurs

# Install dependencies

install_dir="/usr/local"

echo "=========================="
echo "Installing OpenBLAS to $install_dir"
echo "=========================="

#install OpenMPI, a dependency necessary for HPL to perform node communication
cd "$install_dir"
sudo mkdir -p openblas
cd src
sudo wget https://github.com/xianyi/OpenBLAS/releases/download/v0.3.17/OpenBLAS-0.3.17.tar.gz
sudo tar -xvzf OpenBLAS-0.3.17.tar.gz
sudo rm OpenBLAS-0.3.17.tar.gz
cd OpenBLAS-0.3.17

# Change to 'sudo make -j{cores}' to build in parallel
sudo make -j4

sudo make PREFIX="$install_dir/openblas" install

if [ -z "$(ls -A ../../openblas)" ]; then
    echo "OpenBLAS did not install correctly, directory $install_dir/openblas is empty."
    exit 1
else
   echo "============================="
   echo "OpenBLAS installed correctly."
   echo "============================="
fi