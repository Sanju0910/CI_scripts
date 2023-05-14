#!/bin/bash

cd ~
cd ${ROM_NAME}

sudo systemctl disable --now systemd-oomd
export CCACHE_DIR=~/ccache/${ROM_NAME}/avicii

export CCACHE_EXEC=$(which ccache)

export USE_CCACHE=1

ccache -M 16G

ccache -z
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh;

lunch $PRODUCT_NAME-$VARIANT

mka evolution -j8
exit 0;
