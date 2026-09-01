set_clock_latency -source -early -min   -0.0062125 [get_pins {clk_pad/XC}] -clock CLK 
set_clock_latency -source -early -max   -0.0062125 [get_pins {clk_pad/XC}] -clock CLK 
set_clock_latency -source -late -min   -0.0062125 [get_pins {clk_pad/XC}] -clock CLK 
set_clock_latency -source -late -max   -0.0062125 [get_pins {clk_pad/XC}] -clock CLK 
