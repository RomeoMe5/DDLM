#!/bin/sh

rm -rf project
mkdir project
cp *.qsf project
cp *.sdc project

echo "# This file can be empty, all the settings are in .qsf file" > project/de10_lite.qpf
