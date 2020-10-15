#!/bin/bash
clear

echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
date
echo "Start Compilation ^^^^^@^^^^  Time"
echo "Set TurboBoost For Faster Android Kernal Compilation"
/usr/bin/cpupower frequency-set -g performance
/usr/sbin/x86_energy_perf_policy performance
echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo

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


export CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu-
export CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf-
export CC=/usr/bin/aarch64-unknown-linux-gnu-gcc
export LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd
export AR=/usr/bin/aarch64-unknown-linux-gnu-ar
export AS=/usr/bin/aarch64-unknown-linux-gnu-as
export NM=/usr/bin/aarch64-unknown-linux-gnu-nm
export RANLIB=/usr/bin/aarch64-unknown-linux-gnu-ranlib
export STRIP=/usr/bin/aarch64-unknown-linux-gnu-strip
export OBJCOPY=/usr/bin/aarch64-unknown-linux-gnu-objcopy
export OBJDUMP=/usr/bin/aarch64-unknown-linux-gnu-objdump
export HOSTCC=/usr/bin/aarch64-unknown-linux-gnu-gcc
export HOSTLD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd
export HOSTAR=/usr/bin/aarch64-unknown-linux-gnu-gcc-ar


export KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"
export KBUILD_CFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"

PATH="${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14" CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y V=1 ginkgo-vikingo-perf_defconfig


PATH="${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14" CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y  V=1 oldconfig

PATH="${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14" CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y  V=1 nconfig



echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Compiling"
sleep 1


PATH="${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14" CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y V=0

cp /OUT/arch/arm64/boot/Image.gz-dtb .

ls -lash /OUT/arch/arm64/boot/Image.gz-dtb
ls -lash ./Image.gz-dtb

cp /OUT/arch/arm64/boot/dtbo.img dtbo-by-kernel.img
python2 libufdt/src/mkdtboimg.py create /OUT/arch/arm64/boot/dtbo.img /OUT/arch/arm64/boot/dts/qcom/*.dtbo
cp /OUT/arch/arm64/boot/dtbo.img dtbo-by-external.img
ls -lash dtbo-by-kernel.img
ls -lash  dtbo-by-external.img
ls -lash /OUT/arch/arm64/boot/dtbo.img

cp /OUT/arch/arm64/boot/dtbo.img ANYKERNEL/
cp ./Image.gz-dtb ANYKERNEL/

echo "##################################################"
echo "Zip Packing"

cd ANYKERNEL/
rm 4.9.2*.zip
zip -r9 4.14.201-Ginkgo-Vikingo_rV0+RN8-Wed-October-14-2020.zip * -x .git README.md *placeholder
cp 4.14.201-Ginkgo-Vikingo_rV0+RN8-Wed-October-14-2020.zip /home/javashin/Desktop/
ls -lash 4.14.201-Ginkgo-Vikingo_rV0+RN8-Wed-October-14-2020.zip
sha256sum 4.14.201-Ginkgo-Vikingo_rV0+RN8-Wed-October-14-2020.zip
md5sum 4.14.201-Ginkgo-Vikingo_rV0+RN8-Wed-October-14-2020.zip
pwd ; cd .. ; pwd


echo "Done"
echo "Kernel Done"
echo "DONE By JavaShin-X 2020"
