#!/bin/bash

# Update package list
sudo apt update -y

# Install vim
sudo apt-get install vim -y

# Install gcc and g++
sudo apt-get install build-essential g++ -y

# Install git
sudo apt-get install git -y

# Install ntpdate to periodically sync the time
sudo apt-get install ntpdate -y
