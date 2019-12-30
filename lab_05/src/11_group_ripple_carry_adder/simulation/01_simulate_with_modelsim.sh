#!/bin/sh

# recreate a temp folder for all the simulation files

rm -rf sim
mkdir  sim
cd     sim

# start the simulation

vsim -do ../modelsim_script.tcl

# return to the parent folder

cd ..
