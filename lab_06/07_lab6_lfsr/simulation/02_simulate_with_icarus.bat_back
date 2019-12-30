rem recreate a temp folder for all the simulation files

rd /s /q sim
md sim
cd sim

rem compile verilog files for simulation

iverilog -o lfsr.out -s lfsr_tb ../../lfsr.v ../lfsr_tb.v

rem run the simulation and finish on $stop

vvp -l lfsr.log -n lfsr.out

rem show the simulation results in GTKwave

gtkwave dump.vcd

rem return to the parent folder

cd ..
