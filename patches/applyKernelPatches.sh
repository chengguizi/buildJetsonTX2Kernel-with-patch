#!/bin/bash
set -e 

ubuntu_codename=`. /etc/os-release; echo ${UBUNTU_CODENAME/*, /}`

kernel_branch="4.9.140"

PATCH_DIR=$PWD
cd /usr/src/kernel/kernel-4.9

# Patching kernel for RealSense devices
echo -e "\e[32mApplying realsense-uvc patch\e[0m"
patch -p1 < ${PATCH_DIR}/realsense-camera-formats_ubuntu-${ubuntu_codename}-${kernel_branch}.patch 
echo -e "\e[32mApplying realsense-metadata patch\e[0m"
patch -p1 < ${PATCH_DIR}/realsense-metadata-ubuntu-${ubuntu_codename}-${kernel_branch}.patch
echo -e "\e[32mApplying realsense-hid patch\e[0m"
patch -p1 < ${PATCH_DIR}/realsense-hid-ubuntu-${ubuntu_codename}-${kernel_branch}.patch
echo -e "\e[32mpowerlinefrequency-control-fix patch\e[0m"
patch -p1 < ${PATCH_DIR}/realsense-powerlinefrequency-control-fix.patch