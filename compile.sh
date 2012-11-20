#!/bin/bash

export AOSP=$(cd $1; pwd)
export FRANCO=$(cd $2; pwd)

cp config $FRANCO/.config

cd $FRANCO

# make ARCH=arm CROSS_COMPILE=../prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi- 
export ARCH=arm
export CROSS_COMPILE=$AOSP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-

make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE oldconfig
make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE menuconfig
make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE
