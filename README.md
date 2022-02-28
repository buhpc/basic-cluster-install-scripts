# Basic_Cluster_Setup
This repository contains a set of scripts to perform installation of basic HPC packages and dependencies for a cluster. They are meant to be run individually as needed after a cluster has been fully networked.

The following distributions are supported
 - Debian (including Raspbian Pi OS)
 - CentOS

The following HPC packages and dependencies are supported by the scripts
- C/C++ compilers
- fortran compiler
- git
- OpenMPI
- OpenBLAS
- OpenUCX

## IMPORTANT
These scripts are meant to build on each other, so it is critical to read any error logs and look at the comments in each script. All files should be run using the admin account of each node. If an admin account is not available, changes are necessary. For example,
 - All ```install_dir``` variables need to be changed to a directory which is not protected
 - All installations from package managers need to be built from source code if they are not already on the system
 - All commands need to be changed to use explicit binary locations

## DEPENDENCIES
Some scripts here require other scripts to be run first. They are as follows:
 - ```install_openmpi_ucx.sh``` <- ```install_openucx.sh```
 - ```all others``` <- ```install_basic_packages.sh```
