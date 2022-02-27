#!/bin/bash

set -e # exit when any error occurs
set -o xtrace # display command as it is run

# Install dependencies
sudo apt-get install gfortran -y

install_dir="/usr/local"

echo "=========================="
echo "Installing OpenMPI to ${install_dir}"
echo "=========================="

cd "${install_dir}"
sudo mkdir -p openmpi-installation src
cd src
sudo wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.1.tar.gz
sudo tar -xvzf openmpi-4.1.1.tar.gz
sudo rm openmpi-4.1.1.tar.gz
cd openmpi-4.1.1
sudo ./configure --prefix=${install_dir}/openmpi-installation

# Change to 'make all install -j{cores}' to build in parallel
sudo make all install -j4

# A correct installation of OpenMPI will contain executables in the bin directory.
if [ -z "$(ls -A ../../openmpi-installation/bin)" ]; then
    echo "MPI did not install correctly, directory ${install_dir}/openmpi-installation/bin is empty."
    exit 1
else
    echo "========================"
    echo "MPI installed correctly. Make sure to add the following lines"
    echo "export PATH=\"\$PATH:/usr/local/openmpi-installation/bin\""
    echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:/usr/local/openmpi-installation/lib\""
    echo "to the user's .bashrc"
    echo "========================"
    echo ""
    echo "========================"
    echo "Look at the README for instructions on running mpiexec/mpirun commands."
    echo "========================"
fi
