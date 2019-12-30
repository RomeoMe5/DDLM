create_clock -name clk -period 50MHz [get_ports CLOCK_50]

derive_clock_uncertainty

create_generated_clock -name clk_slow \
                       -source [get_ports CLOCK_50] \
                       [get_registers {clk_divider:clk_div|cnt_div[*]}]
                       
set_false_path -from * -to [get_ports {HEX0[*]}]
set_false_path -from * -to [get_ports {HEX1[*]}]
set_false_path -from * -to [get_ports {LEDR[*]}]

set_false_path -from [get_ports {KEY[*]}]  -to [all_clocks]
set_false_path -from [get_ports {SW[*]}]  -to [all_clocks]
