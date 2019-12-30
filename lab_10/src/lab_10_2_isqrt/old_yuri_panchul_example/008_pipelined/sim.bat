rd /s /q sim
md sim
cd sim

vlib work
vlog ..\isqrt_slice_comb.v
vlog ..\isqrt_slice_reg.v
vlog ..\isqrt.v

call ..\sim_config 1
call ..\sim_config 2
call ..\sim_config 4
call ..\sim_config 8
call ..\sim_config 16
