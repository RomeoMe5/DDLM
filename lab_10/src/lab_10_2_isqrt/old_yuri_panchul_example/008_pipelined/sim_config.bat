vlog +define+N_PIPE_STAGES=%1 ..\testbench.v
vsim -c -do "run -all; quit" testbench
copy transcript ..\sim%1.log
