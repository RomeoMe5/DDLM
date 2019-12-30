#!/bin/sh
# synthesize.sh

. ./setup.sh

rm -rf $SYN_DIR
mkdir -p $SYN_DIR
cp top.qsf $SYN_DIR
echo "# This file can be empty, all the settings are in .qsf file" > $SYN_DIR/top.qpf
cd $SYN_DIR

quartus_sh --no_banner --flow compile top | tee syn.log

cd ..
./configure.sh
