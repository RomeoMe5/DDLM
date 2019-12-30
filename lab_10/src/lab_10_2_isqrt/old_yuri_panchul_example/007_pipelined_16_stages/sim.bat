rd /s /q sim
md sim
cd sim

vlib work
vlog ..\isqrt_slice_comb.v
vlog ..\isqrt_slice_reg.v
vlog ..\isqrt.v
vlog ..\testbench.v
vsim -c -do "run -all; quit" testbench

copy transcript ..\sim.log
