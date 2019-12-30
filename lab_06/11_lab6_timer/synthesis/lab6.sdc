create_clock -name clk -period 50MHz [get_ports]

derive_clock_uncertainty

set_false_path -from * -to [get_ports {HEX0[*]}]
set_false_path -from * -to [get_ports {HEX1[*]}]
set_false_path -from * -to [get_ports {HEX2[*]}]
set_false_path -from * -to [get_ports {HEX3[*]}]

set_false_path -from [get_ports {KEY[*]}]  -to [all_clocks]
