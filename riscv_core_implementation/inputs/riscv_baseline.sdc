################################################################################
## CLOCK DEFINITION
################################################################################

create_clock -name clk -period 5.73 -waveform {0 2.865} [get_ports "clk"]


set_ideal_network [get_ports "clk"]
set_ideal_network [get_ports "rst"]


################################################################################
## DESIGN RULE CONSTRAINTS (DRV)
################################################################################

set_max_transition 0.5 [current_design]
set_max_capacitance 0.2 [current_design]
set_max_fanout 10 [current_design]


################################################################################
## CLOCK UNCERTAINTY (JITTER & SKEW MARGIN)
################################################################################

set_clock_uncertainty -setup 0.15 [get_clocks "clk"]
set_clock_uncertainty -hold  0.05 [get_clocks "clk"]


################################################################################
## ENVIRONMENT MODELING (Crucial for realistic synthesis)
################################################################################

set_driving_cell -lib_cell DFQD1 [all_inputs]
set_load 0.01 [all_outputs]
set_input_transition 0.1 [all_inputs]

################################################################################
## INPUT / OUTPUT TIMING CONSTRAINTS
################################################################################


# --- INPUT DELAYS ---
# SETUP
# IMEM
set_input_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "instruction"]
# DMEM
set_input_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "raw_dmem_read"]
# Reset
set_input_delay -max 1.0 -clock [get_clocks "clk"] [get_ports "rst"]

# HOLD

set_input_delay -min 0.1 -clock [get_clocks "clk"] [all_inputs]


# --- OUTPUT DELAYS ---
# SETUP
# IMEM
set_output_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "pc_current"]
#DMEM
set_output_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "alu_result"]
set_output_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "formatted_dmem_write"]
set_output_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "dmem_write_mask"]
set_output_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "mem_read"]
set_output_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "mem_write"]

# HOLD
set_output_delay -min 0.1 -clock [get_clocks "clk"] [all_outputs]
