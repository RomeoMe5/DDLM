create_clock -period 50MHz [get_ports CLOCK_50]
derive_clock_uncertainty

set_false_path -from * -to [get_ports {HEX0[*]}]
set_false_path -from * -to [get_ports {LEDR[*]}]

set_false_path -from [get_ports {KEY[*]}]  -to [all_clocks]
