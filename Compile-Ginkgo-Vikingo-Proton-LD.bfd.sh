#!/bin/bash
clear
date
echo "Start Compilation ^^^^^@^^^^  Time"
echo "Set TurboBoost For Faster Android Kernal Compilation"
/usr/bin/cpupower frequency-set -g performance
/usr/sbin/x86_energy_perf_policy performance

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
echo "Configuring Kernel Ginkgo-Vikingo ."
sleep 1


export KBUILD_BUILD_VERSION=1
export KBUILD_BUILD_USER=JavaShin-X
export KBUILD_BUILD_HOST=igloo-l440.darkmaza.org
export KBUILD_BUILD_TIMESTAMP="$(date -d "@$(git --no-pager show -s --format=%ct)")"


export CROSS_COMPILE="/cross-tc/proton-clang/bin/aarch64-linux-gnu-"
export CROSS_COMPILE_ARM32="/cross-tc/proton-clang/bin/arm-linux-gnueabi-"
export LD_LIBRARY_PATH="/cross-tc/clang/lib64:$LD_LIBRARY_PATH"
export CC="/cross-tc/proton-clang/bin/clang"
export HOSTCC="/cross-tc/proton-clang/bin/clang"
export HOSTCXX="/cross-tc/proton-clang/bin/clang++"
export HOSTLD="/cross-tc/proton-clang/bin/arm-linux-gnueabi-ld.bfd"
#export AR="/cross-tc/proton-clang/bin/llvm-ar"
#export NM="/cross-tc/proton-clang/bin/llvm-nm"
export LD="/cross-tc/proton-clang/bin/arm-linux-gnueabi-ld.bfd"
#export AS="/cross-tc/proton-clang/bin/llvm-as"
#export OBJCOPY="/cross-tc/proton-clang/bin/llvm-objcopy"
#export OBJDUMP="/cross-tc/proton-clang/bin/llvm-objdump"

PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang LD=/cross-tc/proton-clang/bin/arm-linux-gnueabi-ld.bfd CONFIG_CROSS_COMPILE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y ginkgo-vikingo-perf_defconfig

PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang LD=/cross-tc/proton-clang/bin/arm-linux-gnueabi-ld.bfd CONFIG_CROSS_COMPILE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y oldconfig

PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang LD=/cross-tc/proton-clang/bin/arm-linux-gnueabi-ld.bfd CONFIG_CROSS_COMPILE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=yprepare

PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang LD=/cross-tc/proton-clang/bin/arm-linux-gnueabi-ld.bfd CONFIG_CROSS_COMPILE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y nconfig

echo "##################################################"
echo "Start Build - Compiling"
sleep 1

export KCFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KBUILD_CFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe "

#Gcc-10-Optimize
#export KCFLAGS+="--param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"

PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang LD=/cross-tc/proton-clang/bin/arm-linux-gnueabi-ld.bfd CONFIG_CROSS_COMPILE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE_ARM32=/cross-tc/proton-clang/bin/arm-linux-gnueabi- CLANG_TRIPLE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- CROSS_COMPILE=/cross-tc/proton-clang/bin/aarch64-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe " CONFIG_NO_ERROR_ON_MISMATCH=y -j3 V=0

echo "##################################################"
echo "DONE Building"

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
