#!/bin/bash
set -e 


INSTALL_DIR=$PWD

REALSENSE_DIR=${HOME}/git/librealsense

cd ${REALSENSE_DIR}

echo "${green}Applying Model-Views Patch${reset}"
# The render loop of the post processing does not yield; add a sleep
patch -p1 -i $INSTALL_DIR/model-views.patch

echo "${green}Applying Incomplete Frames Patch${reset}"
# The Jetson tends to return incomplete frames at high frame rates; suppress error logging
patch -p1 -i $INSTALL_DIR/incomplete-frame.patch

