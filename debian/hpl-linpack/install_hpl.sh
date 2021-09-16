#!/bin/bash

# Validated on Raspberry Pi 4B

# IMPORTANT
# The line 
# Line 38 cp ./Make.rpi "$home/hpl-2.3/."
# copies a pre-filled file called Make.rpi, used to build HPL on the Raspberry Pi architecture

# For non-validated systems, the
# following lines in Make.rpi need to be updated
#
# 
# 84 MPdir        = /usr/local/mpi/openmpi-2.0.2 // mpi install folder
# 85 MPinc        = -I$(MPdir)/include // OK if this doesn't exist
# 86 MPlib        = $(MPdir)/lib/libmpi.so // or libmpi.a if it exists
#
# 95 LAdir        = $(HOME)/OpenBLAS // OpenBLAS location. This file installs OpenBLAS to /opt/OpenBLAS by default
# 96 LAinc        =
# 97 LAlib        = $(LAdir)/lib/libopenblas.a
#
# 169 CC           = mpicc
# 176 LINKER       = mpicc

set -e # exit when any error occurs

# Install dependencies

install_dir="$home"
script_dir="$(pwd)"

echo "=========================="
echo "Installing HPL to $home"
echo "=========================="

cd "$home"
wget https://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz
tar -xvzf hpl-2.3.tar.gz
rm hpl-2.3.tar.gz
cd hpl-2.3

# Copy the HPL configuration make file
cp "$script_dir/Make.rpi" "$install_dir/hpl-2.3/."

cd "$install_dir/hpl-2.3"

make arch=rpi

if [ -z "$(ls -A bin/rpi)" ]; then
    echo "HPL did not install correctly, directory $(pwd)/bin/rpi is empty."
    exit 1
else
   echo "============================="
   echo "HPL installed correctly. The excutable can be found in $(pwd)/bin/rpi."
   echo "============================="
fi
