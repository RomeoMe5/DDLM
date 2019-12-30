#!/bin/sh
# setup.sh

set -e

export MODELSIM_ROOTDIR=${HOME}/intelFPGA_lite/17.1/modelsim_ase
export PATH=${PATH}:${MODELSIM_ROOTDIR}/linux

#export QUARTUS_ROOTDIR=${HOME}/altera/13.0sp1/quartus
export QUARTUS_ROOTDIR=${HOME}/intelFPGA_lite/17.1/quartus
export PATH=${PATH}:${QUARTUS_ROOTDIR}/bin

SIM_DIR=${PWD}/sim
SYN_DIR=${PWD}/syn
