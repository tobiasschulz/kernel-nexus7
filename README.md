============================================================
== HOT TO BUILD A NEXUS 7 KERNEL WITH FRAMEBUFFER SUPPORT ==
============================================================

1.) Checkout AOSP (see http://source.android.com/source/downloading.html)
    There should be a directory called "prebuilts" in your AOSP source directory.

2.) Checkout Franco Kernel with
      git clone git://github.com/franciscofranco/Grouper-3.1.10.git franco-kernel
    and switch to the latest branch (e.g. android-tegra3-grouper-3.1-jb-fr2)

3.) Apply the patch "bugfixes.patch" to the franco kernel source directory with:
      git apply --stat bugfixes.patch
      git apply --check bugfixes.patch
      git am --signoff < bugfixes.patch

4.) Run the compile script in this repository's source directory:
      ./compile.sh $AOSP $FRANCO
    while the environent variables AOSP and FRANCO stand for the AOSP and Franco kernel directories.
    This will copy our .config to the $FRANCO directory, run make menuconfig and then make.
    The compiled kernel will be written to $FRANCO/arch/arm/boot/zImage
