#!/bin/bash

# Basic setup for a centos cluster
sudo yum install vim -y
sudo yum install gcc-c++ -y

sudo yum install openmpi-devel -y
sudo cp /usr/lib64/openmpi/bin/* /usr/bin/.