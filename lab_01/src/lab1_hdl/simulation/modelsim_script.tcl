
# create modelsim working library
vlib work

# compile all the Verilog sources
vlog  ../testbench.v ../../lab1.v 

# open the testbench module for simulation
vsim -novopt work.testbench

# add all testbench signals to time diagram
add wave sim:/testbench/*

# run the simulation
run -all

# expand the signals time diagram
wave zoom full
