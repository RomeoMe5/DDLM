create_clock -period "50.0 MHz" [get_ports clk]

derive_clock_uncertainty

set_false_path -from * -to led
set_false_path -from * -to [get_ports {io[*]}]
set_false_path -from [get_ports {io[*]}] -to [all_clocks]
