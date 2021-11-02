#!/bin/bash
set -e # exit when any error occurs

# Install dependencies
sudo apt-get install gfortran

install_dir="/usr/local"

echo "=========================="
echo "Installing OpenMPI to $install_dir"
echo "=========================="

cd "$install_dir"
sudo mkdir -p openmpi src
cd src
sudo wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.1.tar.gz
sudo tar -xvzf openmpi-4.1.1.tar.gz
sudo rm openmpi-4.1.1.tar.gz
cd openmpi-4.1.1
sudo ./configure --prefix="$install_dir"/openmpi
# Change to 'make all install -j{cores}' to build in parallel
sudo make all install -j4

if [ -z "$(ls -A ../../openmpi)" ]; then
    echo "MPI did not install correctly, directory $install_dir/openmpi is empty."
    exit 1
else
   echo "========================"
   echo "MPI installed correctly. Make sure to add the line"
   echo "export PATH=\"\$PATH:/usr/local/openmpi/bin\""
   echo "to each user's .bashrc"
   echo "========================"
   echo ""
   echo "========================"
   echo "Look at the README for instructions on running mpiexec/mpirun commands."
   echo "========================"
fi
