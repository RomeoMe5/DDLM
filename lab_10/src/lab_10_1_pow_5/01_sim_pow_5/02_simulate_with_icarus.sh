#!/bin/sh

# recreate a temp folder for all the simulation files

rm -rf sim
mkdir  sim
cd     sim

# compile verilog files for simulation

iverilog -s testbench ../../common/reg*.v ../../*/pow*.v ../testbench.v

# run the simulation and finish on $stop

vvp -l a.lst -n a.out

# show the simulation results in GTKwave

gtkwave dump.vcd

# return to the parent folder

cd ..
