# Basic_Cluster_Setup
This repository contains sets of scripts to do installation of basic HPC packages and dependencies for a cluster. These scripts are meant to be run individually as needed after a cluster has been networked.

The following distributions are supported
 - Debian (including Raspbian Pi OS)
 - CentOS

The following installations are supported by the scripts
- C/C++ compilers
- fortran compiler
- git
- OpenMPI
- OpenBLAS

## IMPORTANT
These scripts are tied together to build on each other as well, make sure to read any error logs and look at the comments in each script. These scripts also should be run using the admin account of each node. If an admin account is not available, these scripts need to be changed. For example,
 - All ```install_dir``` variables in the scritps need to be changed to a directory which is not protected
 - All installations from package managers need to be built from source code
 - All commands need to be changed to use explicit executable locations