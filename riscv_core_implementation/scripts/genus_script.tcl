################################################################################
# CADENCE GENUS: UNIFIED SYNTHESIS FLOW (LOGICAL, PHYSICAL & DFT)
# Optimized for ALU_Top with I/O Pad Integration
################################################################################

# ==============================================================================
# 1. FLOW TOGGLES & DIRECTORY SETUP
# ==============================================================================
# set FLOW_TYPE: Choose "physical" for RC-aware synthesis or "logical" for basic mapping.
# set INCLUDE_DFT: Set to "true" to automatically insert Scan Chains.
set FLOW_TYPE    "physical"  
set INCLUDE_DFT  "false"      

set start_time [clock seconds]

# --- Project Identifiers ---
set DESIGN       "riscv_core"
set GEN_EFF      "high"      ;# Effort level for generic boolean optimization
set MAP_OPT_EFF  "high"      ;# Effort level for technology mapping and timing cleanup

# ------------------------------------------------------------------------------
# ⚠️ IMPORTANT: UPDATE THIS DIRECTORY PATH FOR YOUR SPECIFIC PC ⚠️
# ------------------------------------------------------------------------------
# NOTE FOR USERS: Change the WORK_DIR path below to point to where you saved 
# the project folder on your specific computer. 
# Example: "/home/your_username/Desktop/Lab01_Data"
# Since all other paths are dynamic, this is the ONLY path you need to change!

set WORK_DIR     "/home/cc/Documents/Abdullah/RISCV_synthesis"

# ------------------------------------------------------------------------------

# --- Auto-Generated Sub-Paths (Do not change these) ---
set RTL_DIR      "${WORK_DIR}/sourcecode/rtl"
set PDK_DIR      "${WORK_DIR}/libraries"
set MMMC_FILE    "${WORK_DIR}/inputs/mmmc_master.view"

# --- LEF Files: Standard Cells + I/O Pads ---
set LEF_FILES    [list "${PDK_DIR}/lef/tcbn65lp_9lmT2.lef" "${PDK_DIR}/lef/tpzn65lpgv2od3_9lm.lef"]

# --- Library Lists (Logic Cells + I/O Pads) ---
set LIB_LIST     [list "${PDK_DIR}/libs/tcbn65lptc.lib" "${PDK_DIR}/libs/tpzn65lpgv2od3tc.lib"]

# --- Create Output Infrastructure ---
# Define the main Synthesis_Data directory relative to WORK_DIR
set SYN_DATA_DIR "${WORK_DIR}/export/Synthesis_Data"

# Define subdirectories inside Synthesis_Data
set RPT_DIR      "${SYN_DATA_DIR}/reports"
set OUT_DIR      "${SYN_DATA_DIR}/outputs"
set NETLIST_DIR  "${SYN_DATA_DIR}/netlists"
set DB_DIR       "${SYN_DATA_DIR}/db"

# Explicitly create the Synthesis_Data folder FIRST, then its subdirectories
file mkdir $SYN_DATA_DIR $RPT_DIR $OUT_DIR $NETLIST_DIR $DB_DIR

puts "INFO: Starting $FLOW_TYPE Synthesis Flow (DFT: $INCLUDE_DFT) for $DESIGN"

# ==============================================================================
# 2. LOAD TECHNOLOGY & DESIGN
# ==============================================================================
if {$FLOW_TYPE == "physical"} {
    # read_mmmc: Loads Multi-Mode Multi-Corner views (links SDC to physical Corners)
    read_mmmc $MMMC_FILE
    # read_physical: Loads LEF files (contains cell dimensions and metal layer rules)
    read_physical -lef $LEF_FILES
} else {
    # init_lib_search_path / read_libs: Standard logical flow loading .lib timing models
    set_db init_lib_search_path "$PDK_DIR"
    read_libs $LIB_LIST
}

# read_hdl: Parses the Verilog source code into the tool's memory
read_hdl -sv [glob ${RTL_DIR}/*.sv]

# elaborate: Translates Behavioral Verilog into a Generic Boolean gate database
elaborate $DESIGN
check_design -unresolved ;# Ensures no missing modules or undriven pins

if {$FLOW_TYPE == "physical"} {
    # init_design: Merges the elaborated logic with the physical LEF and MMMC data
    init_design
} else {
    # read_sdc: Applies timing constraints in a basic logical flow
    read_sdc ${WORK_DIR}/inputs/riscv_baseline.sdc
}

# check_timing_intent: Validates that all paths have a defined clock and constraints
check_timing_intent -verbose > ${RPT_DIR}/check_timing_intent.rpt

# ==============================================================================
# 3. DFT SETUP (PRE-SYNTHESIS)
# ==============================================================================
if {$INCLUDE_DFT == "true"} {
    # dft_scan_style: Sets architecture to 'muxed_scan' (standard for TSMC 65nm)
    set_db dft_scan_style muxed_scan
    # define_shift_enable: Creates the physical SE port to toggle Test/Func modes
    define_shift_enable -name SE -active high -create_port SE
    # check_dft_rules: Verifies RTL testability (Checks clock/reset controllability)
    check_dft_rules
}


# ==============================================================================
# 5. CORE SYNTHESIS PIPELINE
# ==============================================================================
set_db syn_generic_effort $GEN_EFF
set_db syn_map_effort     $MAP_OPT_EFF
set_db syn_opt_effort     $MAP_OPT_EFF

if {$FLOW_TYPE == "physical"} {
    # syn_generic: Boolean optimization + Virtual Floorplanning
    syn_generic -physical -create_floorplan
    
    # syn_map: Maps generic logic to actual TSMC standard cells
    syn_map -physical
    
    # --- LEC CHECK 1: RTL vs. Mapped Netlist ---
    write_do_lec -revised_design fv_map -logfile ${RPT_DIR}/lec_rtl_to_mapped.log > ${OUT_DIR}/rtl_to_mapped.do 
    
    # AUTOMATED FIX 1: Prevent Conformal from closing automatically
    exec sed -i "/exit -f/d" ${OUT_DIR}/rtl_to_mapped.do
    
    # syn_opt: Final gate-level optimization using real RC parasitics
    syn_opt
    
    # --- LEC CHECK 2: Mapped Netlist vs. Optimized Netlist ---
    write_do_lec -golden_design fv_map -revised_design fv_opt -logfile ${RPT_DIR}/lec_mapped_to_opt.log > ${OUT_DIR}/mapped_to_opt.do 
    
    # AUTOMATED FIX 2: Patch the fv_opt file path bug AND prevent Conformal from closing
    exec sed -i "/read_design/s| fv_opt| ${NETLIST_DIR}/${DESIGN}_${FLOW_TYPE}_synth.v|g" ${OUT_DIR}/mapped_to_opt.do
    exec sed -i "/exit -f/d" ${OUT_DIR}/mapped_to_opt.do
    
} else {
    syn_generic ;# Math-only optimization
    syn_map     ;# Gate mapping without physical awareness
    syn_opt     ;# Netlist cleanup based on wire-load models
}

# ==============================================================================
# 6. DFT SCAN STITCHING (POST-SYNTHESIS)
# ==============================================================================
if {$INCLUDE_DFT == "true"} {
    # define_scan_chain: Defines the SDO/SDI ports and chain name
    define_scan_chain -name top_chain -sdi scan_in -sdo scan_out -create_ports
    # connect_scan_chains: Physically routes the Q of one flop to the SDI of the next
    connect_scan_chains -auto_create_chains
    # syn_opt -incr: Repairs any timing damage caused by the newly added scan logic
    syn_opt -incr
}

# ==============================================================================
# 7. REPORTING & DATA EXPORT
# ==============================================================================
puts "INFO: Generating Comprehensive Synthesis Reports..."

# report_timing: Generates a detailed report of the worst timing paths.
# -full_pin_names: Provides the complete hierarchical path for every pin in the report.
report_timing -full_pin_names  -max_paths 10 > ${RPT_DIR}/${DESIGN}_${FLOW_TYPE}_timing.rpt

# report_area: Summarizes the physical footprint (cell area) of the design.
report_area > ${RPT_DIR}/${DESIGN}_${FLOW_TYPE}_area.rpt

# report_gates: Provides a breakdown of the standard cell types used (e.g., NAND, NOR, DFF).
report_gates > ${RPT_DIR}/${DESIGN}_${FLOW_TYPE}_gates.rpt

# report_power: Estimates the dynamic, leakage, and total power consumption.
report_power > ${RPT_DIR}/${DESIGN}_${FLOW_TYPE}_power.rpt

# report_qor: "Quality of Result" - Provides a high-level dashboard of timing, area, and power.
# -levels_of_logic: Critical for debugging timing; shows how many gates are in the longest path.
report_qor -levels_of_logic > ${RPT_DIR}/${DESIGN}_${FLOW_TYPE}_qor.rpt

# report_timing -unconstrained: Identifies paths that are missing clocks or constraints.
# In a professional flow, this file should ideally be empty!
# report_timing -unconstrained -max_paths 10 > ${RPT_DIR}/${DESIGN}_unconstrained.rpt

# NEW: DFT Reports (Conditional)
if {$INCLUDE_DFT == "true"} {
    # report_scan_chains: Verifies the connectivity and bit-length of the test hardware.
    report_scan_chains > ${RPT_DIR}/${DESIGN}_${FLOW_TYPE}_scan_chains.rpt
}

# ------------------------------------------------------------------------------
# 8. DATA EXPORT (HANDOFF)
# ------------------------------------------------------------------------------
puts "INFO: Exporting Netlist, SDF, and Physical Database..."

# write_hdl -mapped: Exports the final gate-level Verilog netlist for simulation/Layout.
write_hdl $DESIGN -mapped > ${NETLIST_DIR}/${DESIGN}_${FLOW_TYPE}_synth.v

# write_sdf: Exports timing delays (Setup/Hold/IOPATH) for Gate-Level Simulation.
write_sdf -setuphold merge_always -recrem merge_always -design $DESIGN > ${OUT_DIR}/${DESIGN}_${FLOW_TYPE}_synth.sdf

if {$FLOW_TYPE == "physical"} {
    # write_db: Saves the entire design state to be opened directly in Innovus.
    write_db ${DB_DIR}/${DESIGN}_synth.db
    
    if {$INCLUDE_DFT == "true"} {
        # write_scandef: Essential for Innovus to understand the scan chain physical order.
        write_scandef > ${OUT_DIR}/${DESIGN}_synth.scandef
    }
}

set total_time [expr {[clock seconds] - $start_time}]
puts "INFO: Flow Completed Successfully in $total_time seconds!"
gui_show
