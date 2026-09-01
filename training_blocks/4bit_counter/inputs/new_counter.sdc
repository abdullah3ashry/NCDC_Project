################################################################################
## CLOCK DEFINITION
################################################################################
# create_clock: Tells the tool the frequency of your design.
# -name clk     : Gives the clock object a name for the tool to reference.
# -period 10.0  : Defines a 100 MHz clock (1/10ns = 100MHz).
# -waveform     : Defines the duty cycle. {0 5} means it rises at 0ns and falls at 5ns.
# [get_ports]   : Attaches this mathematical clock to the physical Verilog "clk" input pin.
create_clock -name clk -period 10.0 -waveform {0 5} [get_ports "clk"]

# set_ideal_network: This is crucial for Pre-Layout Logical Synthesis!
# Because we have not run Place & Route (Innovus) yet, there is no physical "clock tree" 
# routing the clock to all the flip-flops. If we don't declare the clock as "ideal", 
# Genus will panic at the massive fanout and try to build a fake clock tree, ruining our area.
set_ideal_network [get_ports "clk"]

# We also set the reset to ideal because it usually drives every flip-flop in the design.
set_ideal_network [get_ports "reset"]


################################################################################
## DESIGN RULE CONSTRAINTS (DRV)
################################################################################
# Electrical "Speed Limits" for signal integrity
set_max_transition 0.5 [current_design]
set_max_capacitance 0.2 [current_design]
set_max_fanout 10 [current_design]


################################################################################
## CLOCK UNCERTAINTY (JITTER & SKEW MARGIN)
################################################################################
# set_clock_uncertainty: Steals a small amount of time from the clock period to 
# act as a safety margin for physical imperfections (jitter and skew).
# -setup : We rob 150ps from the 10ns period. The tool now must optimize data to arrive in 9.85ns.
set_clock_uncertainty -setup 0.15 [get_clocks "clk"]

# -hold  : We force the tool to ensure data stays stable for 50ps *after* the clock edge.
set_clock_uncertainty -hold  0.05 [get_clocks "clk"]


################################################################################
## ENVIRONMENT MODELING (Crucial for realistic synthesis)
################################################################################
# The tool needs to know what is outside this block to size the gates correctly.

# set_driving_cell: Simulates the strength of the gate driving our input pins from the OUTSIDE.
#
# *** CRITICAL NOTE FOR STUDENTS ***
# This command does NOT tell Genus to use a 'DFQD1' cell inside your design! 
# It only tells Genus to assume that the signal arriving from the external environment 
# is being pushed by a DFQD1 cell. Genus will use this to calculate input transition 
# times, but it is still free to pick whatever cells it wants (like 'DFCNQD1' with 
# built-in resets) to build your actual internal logic.
#
# If we don't set this, Genus assumes the inputs have infinite, perfect drive strength.
set_driving_cell -lib_cell DFQD1 [all_inputs]

# set_load: Simulates the capacitance (physical weight) our outputs must push.
# When a signal leaves our block, it has to travel across a wire to reach the next block.
# Wires and the receiving gates have parasitic capacitance. 
# We tell Genus: "Assume all outputs are pushing a 0.01 pF load." 
# If we don't do this, Genus assumes a load of 0 pF and will use the smallest, weakest 
# standard cell possible. That weak cell would fail to drive a real wire on the silicon!
set_load 0.1 [all_outputs]

# set_input_transition: Simulates how "crisp" or "sharp" the incoming signals are.
# In the real world, digital signals do not jump from 0V to 1V instantly. They ramp up.
# We are telling Genus: "Assume it takes 100ps (0.1ns) for the input signals to rise from 0 to 1."
# A slow transition time forces Genus to build stronger receiver gates to prevent errors.
set_input_transition 0.8 [all_inputs]


################################################################################
## INPUT / OUTPUT TIMING CONSTRAINTS
################################################################################
# This section is called "Timing Budgeting." We must account for the time it takes 
# data to travel *before* it reaches our block, and *after* it leaves our block.

# --- INPUT DELAYS ---
# set_input_delay -max: (For Setup Timing) 
# The data arriving at our 'reset' pin took 1.0ns to travel through external logic 
# before reaching us. Because our total clock period is 10ns, our block now only 
# has 9.0ns left to safely capture it!
set_input_delay -max 1.0 -clock [get_clocks "clk"] [get_ports "reset"]

# set_input_delay -min: (For Hold Timing)
# How fast can the external logic change the signal *after* the clock edge?
# 0.1ns means the external environment guarantees the reset signal will remain stable 
# for at least 100ps after the clock edge hits.
set_input_delay -min 0.15 -clock [get_clocks "clk"] [get_ports "reset"]


# --- OUTPUT DELAYS ---
# set_output_delay -max: (For Setup Timing)
# The external logic waiting to receive our 'count' signal needs 1.0ns of time to 
# process it before the next clock edge. Therefore, our block cannot take the full 10ns. 
# We must push the count signal out of our block within 9.0ns!
set_output_delay -max 1.0 -clock [get_clocks "clk"] [get_ports "count"]

# set_output_delay -min: (For Hold Timing)
# The external logic requires the 'count' signal to remain stable for 0.1ns after 
# the clock edge so it can safely capture it. Genus will ensure our outputs do not 
# transition too quickly.
set_output_delay -min 0.15 -clock [get_clocks "clk"] [get_ports "count"]
