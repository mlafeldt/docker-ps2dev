#!/bin/bash
# Based on https://github.com/ps2dev/ps2toolchain/blob/master/scripts/005-ps2sdk.sh
# but with the ability to build a specific SDK version instead of master.

set -e
set -o pipefail

# Make sure PS2SDK's Makefile does not use it
unset PS2SDKSRC

# Download the sources
git clone git://github.com/ps2dev/ps2sdk.git
cd ps2sdk
git checkout -qf "${PS2SDK_VERSION:-master}"

# Build and install
make -j $(nproc)
make install

# Replace newlib's crt0 with the one in PS2SDK
ln -sf "$PS2SDK/ee/startup/crt0.o" "$PS2DEV/ee/lib/gcc-lib/ee/3.2.2/crt0.o"
ln -sf "$PS2SDK/ee/startup/crt0.o" "$PS2DEV/ee/ee/lib/crt0.o"
