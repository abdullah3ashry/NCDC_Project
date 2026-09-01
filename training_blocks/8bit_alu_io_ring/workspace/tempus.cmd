#######################################################
#                                                     
#  Tempus Timing Solution Command Logging File                     
#  Created on Wed Aug 12 04:24:52 2026                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Solution v22.15-s092_1 (64bit) 03/01/2024 14:05 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.15-s092_1 NR240223-1321/22_15-UB (database version 18.20.620) {superthreading v2.20}
#@(#)CDS: AAE 22.15-s036 (64bit) 03/01/2024 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.15-s038_1 () Mar  1 2024 09:01:33 ( )
#@(#)CDS: SYNTECH 22.15-s014_1 () Feb 13 2024 19:37:21 ( )
#@(#)CDS: CPE v22.15-s066

pwd
set_db timing_analysis_type ocv
set_db timing_analysis_cppr both
set_db delaycal_enable_si true
read_mmmc /home/cc/Documents/Abdullah/Lab_04_Data/inputs/mmmc_master.view
#@ Begin verbose source (pre): 
if {![info exists INCLUDE_DFT]} {
set INCLUDE_DFT "false"
}
set WORK_DIR "/home/cc/Documents/Abdullah/Lab_04_Data"
set SDC_FUNC_FILE "${WORK_DIR}/inputs/ALU.sdc"
set LIB_TC        "${WORK_DIR}/libraries/libs/tcbn65lptc.lib"
set LIB_WC        "${WORK_DIR}/libraries/libs/tcbn65lpwc.lib"
set LIB_BC        "${WORK_DIR}/libraries/libs/tcbn65lpbc.lib"
set IO_LIB_TC     "${WORK_DIR}/libraries/libs/tpzn65lpgv2od3tc.lib"
set IO_LIB_WC     "${WORK_DIR}/libraries/libs/tpzn65lpgv2od3wc.lib"
set IO_LIB_BC     "${WORK_DIR}/libraries/libs/tpzn65lpgv2od3bc.lib"
set CAPTABLE_TC   "${WORK_DIR}/inputs/mmmc_files/captable/cln65lp_1p09m+alrdl_top2_typical.captable"
set CAPTABLE_WC   "${WORK_DIR}/inputs/mmmc_files/captable/cln65lp_1p09m+alrdl_top2_rcworst.captable"
set CAPTABLE_BC   "${WORK_DIR}/inputs/mmmc_files/captable/cln65lp_1p09m+alrdl_top2_rcbest.captable"
create_library_set -name tc_libset -timing [list $LIB_TC $IO_LIB_TC]
create_library_set -name wc_libset -timing [list $LIB_WC $IO_LIB_WC]
create_library_set -name bc_libset -timing [list $LIB_BC $IO_LIB_BC]
create_timing_condition -name tc_cond -library_sets {tc_libset}
create_timing_condition -name wc_cond -library_sets {wc_libset}
create_timing_condition -name bc_cond -library_sets {bc_libset}
create_rc_corner -name rc_typical -temperature 25  -cap_table $CAPTABLE_TC
create_rc_corner -name rc_worst   -temperature 125 -cap_table $CAPTABLE_WC
create_rc_corner -name rc_best    -temperature -40 -cap_table $CAPTABLE_BC
create_constraint_mode -name func_mode -sdc_files [list $SDC_FUNC_FILE]
if {$INCLUDE_DFT == "true"} {...}
create_delay_corner -name dc_typical -timing_condition {tc_cond} -rc_corner {rc_typical}
create_delay_corner -name dc_worst   -timing_condition {wc_cond} -rc_corner {rc_worst}
create_delay_corner -name dc_best    -timing_condition {bc_cond} -rc_corner {rc_best}
create_analysis_view -name view_func_typical -constraint_mode {func_mode} -delay_corner {dc_typical}
create_analysis_view -name view_func_setup   -constraint_mode {func_mode} -delay_corner {dc_worst}
create_analysis_view -name view_func_hold    -constraint_mode {func_mode} -delay_corner {dc_best}
if {$INCLUDE_DFT == "true"} {...}
if {$INCLUDE_DFT == "true"} {...
} else {
set_analysis_view  -setup   {view_func_setup}  -hold    {view_func_hold}  -leakage {view_func_typical}  -dynamic {view_func_typical}
}
#@ End verbose source: /home/cc/Documents/Abdullah/Lab_04_Data/inputs/mmmc_master.view
puts "INFO: Reading Technology LEFs..."
read_physical -lef /home/cc/Documents/Abdullah/Lab_04_Data/libraries/lef/tcbn65lp_9lmT2.lef
puts "INFO: Reading Post-Route Netlist..."
read_netlist /home/cc/Documents/Abdullah/Lab_04_Data/export/outputs/pnr/counter.final.v
puts "INFO: Initializing Design Database..."
init_design
set spef_file "/home/cc/Documents/Abdullah/Lab_04_Data/export/outputs/pnr/counter.spef"
puts "INFO: Mapping SPEF parasitics to RC Corners..."
read_spef -rc_corner rc_worst $spef_file
read_spef -rc_corner rc_best $spef_file
read_spef -rc_corner rc_typical $spef_file
set_db timing_analysis_type ocv
set_db timing_analysis_cppr both
set_db delaycal_enable_si true
puts "INFO: Loading MMMC View Definitions..."
read_mmmc /home/cc/Documents/Abdullah/Lab_04_Data/inputs/mmmc_master.view
puts "INFO: Reading Technology LEFs..."
read_physical -lef /home/cc/Documents/Abdullah/Lab_04_Data/libraries/lef/tcbn65lp_9lmT2.lef
puts "INFO: Reading Post-Route Netlist..."
read_netlist /home/cc/Documents/Abdullah/Lab_04_Data/export/outputs/pnr/top_wrapper.final.v
puts "INFO: Initializing Design Database..."
init_design
set spef_file "/home/cc/Documents/Abdullah/Lab_04_Data/export/outputs/pnr/top_wrapper.spef"
puts "INFO: Mapping SPEF parasitics to RC Corners..."
read_spef -rc_corner rc_worst $spef_file
read_spef -rc_corner rc_best $spef_file
read_spef -rc_corner rc_typical $spef_file
exit
