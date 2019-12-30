#!/bin/sh
# simulate.sh

. ./setup.sh

rm -rf   $SIM_DIR
mkdir -p $SIM_DIR
cd       $SIM_DIR

vsim -do ../modelsim_script.tcl
