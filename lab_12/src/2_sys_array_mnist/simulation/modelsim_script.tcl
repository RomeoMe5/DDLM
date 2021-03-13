# create modelsim working library
vlib work

# compile all the Verilog sources
vlog  ../../*.v ../../../common/simulation/*.v

# open the testbench module for simulation
vsim -novopt work.testbench_wrapper

# add all testbench signals to time diagram
add wave -radix hex sim:/testbench_wrapper/*
add wave -radix hex sim:/testbench_wrapper/als/*

# run the simulation
run -all

# expand the signals time diagram
wave zoom full