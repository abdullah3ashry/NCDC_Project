################################################################################
# CADENCE TEMPUS: STANDALONE MASTER SIGNOFF STA SCRIPT
# Design: counter (65nm)
################################################################################
puts "INFO: Starting Tempus Signoff Flow..."

# ==============================================================================
# 1. ENGINE CONFIGURATION
# ==============================================================================
# Enable On-Chip Variation (OCV) to simulate manufacturing tolerances
set_db timing_analysis_type ocv

# Enable Clock Path Pessimism Removal (CPPR) to remove common-path artificial delays
set_db timing_analysis_cppr both

# Enable Signal Integrity (SI) to account for Crosstalk delays between wires
set_db delaycal_enable_si false

# ==============================================================================
# 2. LOAD DESIGN DATA
# ==============================================================================
# A. Load the MMMC View Definition (Links .libs to .sdcs)
puts "INFO: Loading MMMC View Definitions..."
read_mmmc /home/cc/Documents/Abdullah/Lab_04_Data/inputs/mmmc_master.view

# B. Load Technology LEFs (Crucial for RC Extraction awareness)
puts "INFO: Reading Technology LEFs..."
read_physical -lef /home/cc/Documents/Abdullah/Lab_04_Data/libraries/lef/tcbn65lp_9lmT2.lef

# C. Load the Final Routed Netlist from Innovus
puts "INFO: Reading Post-Route Netlist..."
read_netlist /home/cc/Documents/Abdullah/Lab_04_Data/export/Innovus_Data/outputs/pnr/top_wrapper.final.v

# D. Initialize the Timing Graph
# This builds the logic connectivity in memory
puts "INFO: Initializing Design Database..."
init_design

# ==============================================================================
# 3. LOAD PHYSICAL PARASITICS (SPEF)
# ==============================================================================
# We map the physical copper delays to their respective timing corners
set spef_file "/home/cc/Documents/Abdullah/Lab_04_Data/export/Innovus_Data/outputs/pnr/top_wrapper.spef"

puts "INFO: Mapping SPEF parasitics to RC Corners..."

# Worst-Case (Setup) Corner
read_spef -rc_corner rc_worst $spef_file

# Best-Case (Hold) Corner
read_spef -rc_corner rc_best $spef_file

# Typical Corner (Optional)
read_spef -rc_corner rc_typical $spef_file

# ==============================================================================
# 4. ANALYSIS & REPORTING
# ==============================================================================
# Define which views to use for Setup and Hold auditing
set_analysis_view -setup {view_func_setup} -hold {view_func_hold}

# Force a full timing update to propagate parasitics through the graph
puts "INFO: Building final timing graph with parasitics..."
update_timing -full

# Create report directory
file mkdir /home/cc/Documents/Abdullah/Lab_04_Data/export/Tempus_Data/reports/tempus_signoff

# --- Generate Signoff Reports ---
puts "INFO: Generating Signoff Scorecards..."

# 1. Global Summary (Check TNS/WNS here)
report_timing_summary > /home/cc/Documents/Abdullah/Lab_04_Data/export/Tempus_Data/reports/tempus_signoff/summary.rpt

# 2. Detailed Setup Report (Top 10 Critical Paths)
report_timing -late  -max_paths 10 > /home/cc/Documents/Abdullah/Lab_04_Data/export/Tempus_Data/reports/tempus_signoff/setup_paths.rpt

# 3. Detailed Hold Report (Top 10 Critical Paths)
report_timing -early -max_paths 10 > /home/cc/Documents/Abdullah/Lab_04_Data/export/Tempus_Data/reports/tempus_signoff/hold_paths.rpt

# 4. Design Rule Violations (Max Cap/Tran/Fanout)
# In Stylus, we explicitly list the DRV types we want to audit
report_constraint -drv_violation_type {max_capacitance max_transition max_fanout} > /home/cc/Documents/Abdullah/Lab_04_Data/export/Tempus_Data/reports/tempus_signoff/drv.rpt

puts "INFO: Tempus Signoff Script Completed Successfully!"
