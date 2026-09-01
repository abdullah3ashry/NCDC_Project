################################################################################
## TEST MODE (SHIFT) CLOCK DEFINITION
################################################################################
# ATE testers run much slower than normal functional clocks. 
# We define a 50.0ns period (20 MHz) for shifting data through the scan chain.
create_clock -name clk -period 50.0 -waveform {0 25} [get_ports "clk"]

set_ideal_network [get_ports "clk"]
set_ideal_network [get_ports "reset"]

# We keep standard margins, but maybe relax setup slightly due to the slow clock
set_clock_uncertainty -setup 0.20 [get_clocks "clk"]
set_clock_uncertainty -hold  0.05 [get_clocks "clk"]


################################################################################
## DESIGN RULE CONSTRAINTS (DRV)
################################################################################
# Keep DRVs consistent across modes
set_max_transition 0.5 [current_design]
set_max_capacitance 0.2 [current_design]
set_max_fanout 10 [current_design]


################################################################################
## DFT TEST EXCEPTIONS (The Magic Command)
################################################################################
# By forcing SE to 1, Genus knows the scan multiplexers are switched to the 
# "shift" path. It will completely ignore your normal functional logic and ONLY 
# analyze the wires connecting the Q pin of one flop to the SDI pin of the next!
set_case_analysis 1 [get_ports "SE"]

# The reset pin is usually held inactive during a scan shift operation.
set_case_analysis 0 [get_ports "reset"]

################################################################################
## ENVIRONMENT MODELING & I/O
################################################################################
set_driving_cell -lib_cell DFQD1 [all_inputs]
set_load 0.01 [all_outputs]
set_input_transition 0.1 [all_inputs]

# --- SCAN INPUT (scan_in) ---
# The tester machine needs time to push the data into our chip.
set_input_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "scan_in"]
set_input_delay -min 0.2 -clock [get_clocks "clk"] [get_ports "scan_in"]

# --- SCAN OUTPUT (scan_out) ---
# The tester machine needs time to read the data coming out of our chip.
set_output_delay -max 2.0 -clock [get_clocks "clk"] [get_ports "scan_out"]
set_output_delay -min 0.2 -clock [get_clocks "clk"] [get_ports "scan_out"]

# --- IGNORE NORMAL I/O ---
# During a scan shift, we do not care about the normal functional inputs and outputs.
# We cut timing to them so Genus doesn't optimize them for the 20MHz clock.
set_false_path -to [get_ports "count"]