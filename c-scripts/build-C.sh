#!/bin/bash
clear 

#echo "Start Compiling FORTIFY-STOCK."

echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
date
echo "Start Compilation ^^^^^@^^^^  Time"
echo "Set TurboBoost For Faster Android Kernal Compilation"
/usr/bin/cpupower frequency-set -g performance
/usr/sbin/x86_energy_perf_policy performance
#echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Preparing"
sleep 1

umount /OUT
rm -rf /OUT
export ARCH=arm64
export SUBARCH=arm
mkdir /OUT
mount /OUT

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Configuring SelinuxKernel Enforce."
sleep 1


export KBUILD_BUILD_VERSION=1
export KBUILD_BUILD_USER=JavaShin-X
export KBUILD_BUILD_HOST=igloo-l440.darkmaza.org
export KBUILD_BUILD_TIMESTAMP="$(date -d "@$(git --no-pager show -s --format=%ct)")"


export CROSS_COMPILE="/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu-"
export CROSS_COMPILE_ARM32="/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf-"
export LD="/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu-ld.bfd"
export HOSTLD="/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu-ld.bfd"
export LD_LIBRARY_PATH="/cross-tc/clang/lib64:$LD_LIBRARY_PATH"
export CC="/cross-tc/clang/bin/clang"
export HOSTCC="/cross-tc/clang/bin/clang"
export HOSTCXX="/cross-tc/clang/bin/clang++"


PATH="/cross-tc/clang/bin:/cross-tc/aarch64/bin:/cross-tc/armv7-eabihf/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y CROSS_COMPILE_ARM32=/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf- CLANG_TRIPLE_ARM32=/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf- CLANG_TRIPLE=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu- CROSS_COMPILE=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_BUILD_ARM64_DT_OVERLAY=y ginkgo-vikingo-perf_defconfig

PATH="/cross-tc/clang/bin:/cross-tc/aarch64/bin:/cross-tc/armv7-eabihf/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y CROSS_COMPILE_ARM32=/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf- CLANG_TRIPLE_ARM32=/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf- CLANG_TRIPLE=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu- CROSS_COMPILE=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_BUILD_ARM64_DT_OVERLAY=y oldconfig

PATH="/cross-tc/clang/bin:/cross-tc/aarch64/bin:/cross-tc/armv7-eabihf/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y CROSS_COMPILE_ARM32=/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf- CLANG_TRIPLE_ARM32=/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf- CLANG_TRIPLE=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu- CROSS_COMPILE=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_BUILD_ARM64_DT_OVERLAY=y prepare


echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Compiling"
sleep 1

export KCFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KBUILD_CFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe "

#Gcc-10-Optimize
export KCFLAGS+="--param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"

PATH="/cross-tc/clang/bin:/cross-tc/aarch64/bin:/cross-tc/armv7-eabihf/bin:${PATH}" make -j4 O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y CROSS_COMPILE_ARM32=/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf- CLANG_TRIPLE_ARM32=/cross-tc/armv7-eabihf/bin/arm-buildroot-linux-gnueabihf- CLANG_TRIPLE=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu- CROSS_COMPILE=/cross-tc/aarch64/bin/aarch64-buildroot-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig SELINUX_DEFCONFIG=selinux_defconfig KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe " CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_BUILD_ARM64_DT_OVERLAY=y V=0

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "DONE"

echo "Set Normal Speed To Cooldown CPU After Compilation"
#/usr/bin/cpupower frequency-set -g powersave
#/usr/sbin/x86_energy_perf_policy power
#echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo

cp /OUT/arch/arm64/boot/Image.gz-dtb .

ls -lash /OUT/arch/arm64/boot/Image.gz-dtb
ls -lash ./Image.gz-dtb

#python2 libufdt/src/mkdtboimg.py create /OUT/arch/arm64/boot/dtbo.img /OUT/arch/arm64/boot/dts/qcom/*.dtbo
cp /OUT/arch/arm64/boot/dtbo.img .
ls -lash /OUT/arch/arm64/boot/dtbo.img
ls -lash  ./dtbo.img

cp ./dtbo.img ANYKERNEL/
cp ./Image.gz-dtb ANYKERNEL/

#cd ANYKERNEL/
#rm 4.9.2*.zip
#zip -r9 4.9.238-DirtyDragons_rV5+OCEAN-Thursday-October-01-2020.zip * -x .git README.md *placeholder
#cp 4.9.238-DirtyDragons_rV5+OCEAN-Thursday-October-01-2020.zip /home/javashin/Desktop/
#ls -lash 4.9.238-DirtyDragons_rV5+OCEAN-Thursday-October-01-2020.zip ; pwd ; cd .. ; pwd

echo "YAY"
echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
echo "DONE By JavaShin-X 2020"
