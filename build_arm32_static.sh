#!/bin/bash

# 1. Define the Toolchain Path
TOOLCHAIN_BIN="/opt/fullhan/arm-fhva12c-linux-uclibcgnueabihf-b6/bin"
CROSS_COMPILE="${TOOLCHAIN_BIN}/arm-fhva12c-linux-uclibcgnueabihf-"

# 2. Set Compiler Variables
export CC="${CROSS_COMPILE}gcc"
export CXX="${CROSS_COMPILE}g++"
export AR="${CROSS_COMPILE}ar"
export RANLIB="${CROSS_COMPILE}ranlib"
export STRIP="${CROSS_COMPILE}strip"

# 3. Define Relative Prefix (Install to 'install_dir' in current folder)
RELATIVE_PREFIX="$(pwd)/output_arm32"

echo "Building ZBar for Fullhan ARM32..."
echo "Install destination: ${RELATIVE_PREFIX}"

# 4. Run Configure
./configure \
    --host=arm-fhva12c-linux-uclibcgnueabihf \
    --prefix="${RELATIVE_PREFIX}" \
    --enable-static \
    --disable-shared \
    --without-gtk \
    --without-qt \
    --without-python \
    --without-imagemagick \
    --without-x \
    --disable-video \
    --without-dbus \
    --without-jpeg

# 5. Compile and Install
make -j$(nproc)
make install
