#!/bin/bash
set -e # exit when any error occurs

# Use this file when OpenMPI needs to be built with UCX support. Requires install_openucx.sh to first be run. Originally needed for Oracle Cloud Cluster in the SC21 Student Cluster Competition.

# Install dependencies
sudo yum install gcc-gfortran -y

install_dir="/usr/local"

echo "=========================="
echo "Installing OpenMPI to ${install_dir}"
echo "=========================="

cd "$install_dir"
sudo mkdir -p openmpi-installation src
cd src
sudo wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.1.tar.gz
sudo tar -xvzf openmpi-4.1.1.tar.gz
sudo rm openmpi-4.1.1.tar.gz
cd openmpi-4.1.1
sudo ./configure --prefix="${install_dir}/openmpi-installation" --with-ucx="${install_dir}/openucx-installation" --enable-mca-no-build=btl-uct

# Change to 'make all install -j{cores}' to build in parallel
sudo make all install -j16

if [ -z "$(ls -A ../../openmpi-installation/bin)" ]; then
    echo "MPI did not install correctly, directory ${install_dir}/openmpi-installation/bin is empty."
    exit 1
else
   echo "========================"
   echo "MPI installed correctly. Make sure to add the line"
   echo "export PATH=\"\${PATH}:/usr/local/openmpi-installation/bin\""
   echo "to each user's .bashrc"
   echo "========================"
   echo ""
   echo "========================"
   echo "Look at the README for instructions on running mpiexec/mpirun commands."
   echo "========================"
fi
