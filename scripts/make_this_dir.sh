#!/bin/sh

OPENIPC_OUTPUT_DIR="/home/paul/openipc-fw-output/t31_lite-br2023.08.1"

export ARCH=mips
export CROSS_PATH="${OPENIPC_OUTPUT_DIR}/host/bin"
export CROSS_COMPILE="$(readlink -f $CROSS_PATH)/mipsel-openipc-linux-musl-"
export ISVP_ENV_KERNEL_DIR="${OPENIPC_OUTPUT_DIR}/build/linux-custom"

make
