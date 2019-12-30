rem recreate a temp folder for all the simulation files

rd /s /q sim
md sim
cd sim

rem compile verilog files for simulation

iverilog -o shift_reg.out -s simple_reg_tb ../../shift_reg.v ../shift_reg_tb.v

rem run the simulation and finish on $stop

vvp -l shift_reg.log -n shift_reg.out

rem show the simulation results in GTKwave

gtkwave dump.vcd

rem return to the parent folder

cd ..
