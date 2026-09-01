################################################################################
## CLOCK DEFINITION
################################################################################
# Using get_pins on the clk_pad/XC pin as per the new guidelines.
# XC is the "clean" clock signal that actually drives the ALU.
create_clock -name CLK -period 10.0 -waveform {0 5} [get_pins {clk_pad/XC}]

# Ideal networks are applied to the physical input ports to prevent 
# synthesis from trying to buffer the high-fanout nets before layout.
set_ideal_network [get_ports "clk_in"]
set_ideal_network [get_ports "rst"]

################################################################################
## DESIGN RULE CONSTRAINTS (DRV)
################################################################################
set_max_transition 0.5 [current_design]
set_max_capacitance 0.2 [current_design]
set_max_fanout 10 [current_design]

################################################################################
## CLOCK UNCERTAINTY
################################################################################
set_clock_uncertainty -setup 0.15 [get_clocks "CLK"]
set_clock_uncertainty -hold  0.05 [get_clocks "CLK"]

################################################################################
## ENVIRONMENT MODELING
################################################################################
# These are still applied to the top-level ports (the actual chip pins).
set_driving_cell -lib_cell DFQD1 [all_inputs]
set_load 0.01 [all_outputs]
set_input_transition 0.1 [all_inputs]

################################################################################
## INPUT / OUTPUT TIMING CONSTRAINTS
################################################################################

# --- INPUT DELAYS (A, B, Sel, rst) ---
# We use the internal pin 'C' of the input pad instances. 
# This tells the tool: "The signal arriving at the ALU core input has X delay."
set_input_delay -clock CLK -max 2.0 [get_pins {rst_inst/C A_inst*/C B_inst*/C sel_inst*/C}]
set_input_delay -clock CLK -min 0.5 [get_pins {rst_inst/C A_inst*/C B_inst*/C sel_inst*/C}]

# --- OUTPUT DELAYS (Out) ---
# We use the internal pin 'I' of the output pad instances.
# This represents the data leaving the ALU core and entering the Pad.
set_output_delay -clock CLK -max 5.0 [get_pins {out_inst*/I}]
set_output_delay -clock CLK -min 2.0 [get_pins {out_inst*/I}]