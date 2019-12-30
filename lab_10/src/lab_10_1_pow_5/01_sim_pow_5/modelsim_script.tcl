
# create modelsim working library

vlib work

# compile all the Verilog sources

vlog ../../common/reg*.v
vlog ../../*/pow*.v
vlog ../testbench.v

# open the testbench module for simulation

vsim -novopt work.testbench

# add all testbench signals to time diagram

# add wave -radix hex sim:/testbench/*

add wave -radix bin sim:/testbench/clk
add wave -radix bin sim:/testbench/rst_n
add wave -radix bin sim:/testbench/arg_vld
add wave -radix hex sim:/testbench/arg
add wave -radix bin sim:/testbench/res_vld_pow_5_single_cycle_struct
add wave -radix hex sim:/testbench/res_pow_5_single_cycle_struct
add wave -radix bin sim:/testbench/res_vld_pow_5_en_single_cycle_struct
add wave -radix hex sim:/testbench/res_pow_5_en_single_cycle_struct
add wave -radix bin sim:/testbench/res_vld_pow_5_multi_cycle_struct_todo
add wave -radix hex sim:/testbench/res_pow_5_multi_cycle_struct_todo
add wave -radix bin sim:/testbench/res_vld_pow_5_multi_cycle_struct
add wave -radix hex sim:/testbench/res_pow_5_multi_cycle_struct
add wave -radix bin sim:/testbench/res_vld_pow_5_multi_cycle_always
add wave -radix hex sim:/testbench/res_pow_5_multi_cycle_always
add wave -radix bin sim:/testbench/res_vld_pow_5_en_multi_cycle_struct
add wave -radix hex sim:/testbench/res_pow_5_en_multi_cycle_struct
add wave -radix bin sim:/testbench/res_vld_pow_5_en_multi_cycle_always
add wave -radix hex sim:/testbench/res_pow_5_en_multi_cycle_always
add wave -radix bin {sim:/testbench/res_vld_pow_n_pipe_struct_5[0]}
add wave -radix hex {sim:/testbench/res_pow_n_pipe_struct_5[7:0]}
add wave -radix bin {sim:/testbench/res_vld_pow_n_en_pipe_struct_5[0]}
add wave -radix hex {sim:/testbench/res_pow_n_en_pipe_struct_5[7:0]}
add wave -radix bin {sim:/testbench/res_vld_pow_n_pipe_struct_6[0]}
add wave -radix hex {sim:/testbench/res_pow_n_pipe_struct_6[7:0]}
add wave -radix bin {sim:/testbench/res_vld_pow_n_en_pipe_struct_6[0]}
add wave -radix hex {sim:/testbench/res_pow_n_en_pipe_struct_6[7:0]}

# run the simulation

run -all

# expand the signals time diagram

wave zoom full
