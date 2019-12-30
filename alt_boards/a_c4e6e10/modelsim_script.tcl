vlib work
vlog ../*.v
vsim -novopt work.testbench
add wave -radix bin sim:/testbench/*
run -all
wave zoom full
