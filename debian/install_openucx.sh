#!/bin/bash
set -e # exit when any error occurs

# Install dependencies

install_dir="/usr/local"

echo "=========================="
echo "Installing OpenUCX to $install_dir"
echo "=========================="

cd "$install_dir"
sudo mkdir -p openucx-installation
cd src
sudo wget https://github.com/openucx/ucx/releases/download/v1.11.2/ucx-1.11.2.tar.gz
sudo tar -xvzf ucx-1.11.2.tar.gz
sudo rm ucx-1.11.2.tar.gz
cd ucx-1.11.2

sudo ./configure --prefix="$install_dir/openucx-installation"

# Change to 'sudo make -j{cores}' to build in parallel
sudo make -j4

sudo make install

if [ -z "$(ls -A ../../openucx-installation/bin)" ]; then
    echo "OpenUCX did not install correctly, directory $install_dir/openucx-installation/bin is empty."
    exit 1
else
   echo "============================="
   echo "OpenUCX installed correctly."
   echo "============================="
fi
