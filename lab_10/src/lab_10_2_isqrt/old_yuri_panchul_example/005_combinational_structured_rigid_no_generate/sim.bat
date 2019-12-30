rd /s /q sim
md sim
cd sim

vlib work
vlog ..\isqrt_slice.v
vlog ..\isqrt.v
vlog ..\testbench.v
vsim -c -do "run -all; quit" testbench

copy transcript ..\sim.log
