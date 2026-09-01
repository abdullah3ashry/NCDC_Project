################################################################################
# CADENCE TEMPUS: STANDALONE MASTER SIGNOFF STA SCRIPT (ANNOTATED & DYNAMIC)
# Design: counter (65nm)
# Purpose: Final Static Timing Analysis (STA) with accurate parasitic extraction
################################################################################
puts "INFO: Starting Tempus Signoff Flow..."

# ==============================================================================
# 0. DIRECTORY SETUP & VARIABLES
# ==============================================================================
# ------------------------------------------------------------------------------
# ⚠️ IMPORTANT: UPDATE THIS DIRECTORY PATH FOR YOUR SPECIFIC PC ⚠️
# ------------------------------------------------------------------------------
# set WORK_DIR: Defines the root workspace directory. All other paths derive from this.
# (Note: If your data is inside "Lab01_Data", append it to this path).
set WORK_DIR                  "/home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data"
# ------------------------------------------------------------------------------

set design(TOPLEVEL)          "counter"

# --- Dynamic Path Generation ---
set MMMC_FILE                 "${WORK_DIR}/inputs/mmmc_master.view"
set LEF_FILE                  "${WORK_DIR}/libraries/lef/tcbn65lp_9lmT2.lef"

# Input Netlist & SPEF from Innovus
set PNR_OUT_DIR               "${WORK_DIR}/export/Innovus_Data/outputs/pnr"
set NETLIST_FILE              "${PNR_OUT_DIR}/${design(TOPLEVEL)}.final.v"
set SPEF_FILE                 "${PNR_OUT_DIR}/${design(TOPLEVEL)}.spef"

# Output Reporting Directory
set TEMPUS_RPT_DIR            "${WORK_DIR}/export/Innovus_Data/reports/tempus_signoff"

# Automatically create the reporting directory to prevent "No such file" errors
file mkdir $TEMPUS_RPT_DIR

# ==============================================================================
# 1. ENGINE CONFIGURATION
# ==============================================================================
# timing_analysis_type ocv: Enables On-Chip Variation. Accounts for PVT (Process, Voltage, Temperature) 
# differences across different physical areas of the silicon die.
set_db timing_analysis_type ocv

# timing_analysis_cppr both: Clock Path Pessimism Removal. Removes artificially added setup/hold 
# delays from common clock paths shared by both launch and capture flip-flops.
set_db timing_analysis_cppr both

# delaycal_enable_si true: Enables Signal Integrity (SI) analysis. Calculates delay variations 
# caused by crosstalk (coupling capacitance) between neighboring physical wires.
set_db delaycal_enable_si true

# ==============================================================================
# 2. LOAD DESIGN DATA
# ==============================================================================
# A. Load the MMMC View Definition
# read_mmmc: Loads the timing constraints (SDC), library models (.lib), and connects them to Analysis Views.
puts "INFO: Loading MMMC View Definitions..."
read_mmmc $MMMC_FILE

# B. Load Technology LEFs
# read_physical: Crucial for accurate RC Extraction awareness. Tempus needs physical 
# layer rules and cell spacing info for accurate Signal Integrity calculations.
puts "INFO: Reading Technology LEFs..."
read_physical -lef $LEF_FILE

# C. Load the Final Routed Netlist from Innovus
# read_netlist: Loads the gate-level Verilog file that Innovus generated after full routing.
puts "INFO: Reading Post-Route Netlist..."
read_netlist $NETLIST_FILE

# D. Initialize the Timing Graph
# init_design: Compiles the netlist, LEF, and MMMC data to build the mathematical logic graph in memory.
puts "INFO: Initializing Design Database..."
init_design

# ==============================================================================
# 3. LOAD PHYSICAL PARASITICS (SPEF)
# ==============================================================================
puts "INFO: Mapping SPEF parasitics to RC Corners..."

# read_spef: Maps the physical copper wire delays (Resistance & Capacitance) extracted 
# from Innovus to their respective physical corners.

# Worst-Case (Setup) Corner: Simulates high temp, low voltage, max wire resistance.
read_spef -rc_corner rc_worst $SPEF_FILE

# Best-Case (Hold) Corner: Simulates low temp, high voltage, min wire resistance (signals travel too fast).
read_spef -rc_corner rc_best $SPEF_FILE

# Typical Corner (Optional): Nominal operating conditions.
read_spef -rc_corner rc_typical $SPEF_FILE

# ==============================================================================
# 4. ANALYSIS & REPORTING
# ==============================================================================
# set_analysis_view: Tells Tempus which specific MMMC views to use for Setup (Max delay) and Hold (Min delay) checking.
set_analysis_view -setup {view_func_setup} -hold {view_func_hold}

# update_timing -full: Forces Tempus to propagate all the newly loaded SPEF parasitics 
# through the entire design graph before generating any reports.
puts "INFO: Building final timing graph with parasitics..."
update_timing -full

# --- Generate Signoff Reports ---
puts "INFO: Generating Signoff Scorecards in $TEMPUS_RPT_DIR..."

# 1. Global Summary (Check TNS/WNS here)
# report_timing_summary: Provides a high-level dashboard of total negative slack (TNS) and violating paths.
report_timing_summary > ${TEMPUS_RPT_DIR}/summary.rpt

# 2. Detailed Setup Report (Top 10 Critical Paths)
# report_timing -late: Extracts the worst-case (longest) paths to ensure data arrives safely before the clock edge.
report_timing -late  -max_paths 10 > ${TEMPUS_RPT_DIR}/setup_paths.rpt

# 3. Detailed Hold Report (Top 10 Critical Paths)
# report_timing -early: Extracts the best-case (shortest) paths to ensure data doesn't overwrite the previous cycle too quickly.
report_timing -early -max_paths 10 > ${TEMPUS_RPT_DIR}/hold_paths.rpt

# 4. Design Rule Violations (Max Cap/Tran/Fanout)
# report_constraint: Explicitly audits electrical rules (DRVs). Even if setup/hold pass, 
# a chip can fail if a wire has too much capacitance or a signal transitions too slowly.
report_constraint -drv_violation_type {max_capacitance max_transition max_fanout} > ${TEMPUS_RPT_DIR}/drv.rpt

puts "INFO: Tempus Signoff Script Completed Successfully!"
