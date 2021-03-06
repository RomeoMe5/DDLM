create_clock -name clk -period 50MHz [get_ports CLOCK_50]

derive_clock_uncertainty

set_false_path -from * -to [get_ports {HEX0[*]}]
set_false_path -from * -to [get_ports {HEX1[*]}]
set_false_path -from * -to [get_ports {GPIO[*]}]

set_false_path -from [get_ports {KEY[*]}]  -to [all_clocks]
set_false_path -from [get_ports {GPIO[*]}] -to [all_clocks]
