#######################################################
#                                                     
#  Tempus Timing Solution Command Logging File                     
#  Created on Tue Aug 11 01:43:46 2026                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Solution v22.15-s092_1 (64bit) 03/01/2024 14:05 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.15-s092_1 NR240223-1321/22_15-UB (database version 18.20.620) {superthreading v2.20}
#@(#)CDS: AAE 22.15-s036 (64bit) 03/01/2024 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.15-s038_1 () Mar  1 2024 09:01:33 ( )
#@(#)CDS: SYNTECH 22.15-s014_1 () Feb 13 2024 19:37:21 ( )
#@(#)CDS: CPE v22.15-s066

set WORK_DIR                  "/home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data"
set design(TOPLEVEL)          "counter"
set MMMC_FILE                 "${WORK_DIR}/inputs/mmmc_master.view"
set LEF_FILE                  "${WORK_DIR}/libraries/lef/tcbn65lp_9lmT2.lef"
set PNR_OUT_DIR               "${WORK_DIR}/export/Innovus_Data/outputs/pnr"
set NETLIST_FILE              "${PNR_OUT_DIR}/${design(TOPLEVEL)}.final.v"
set SPEF_FILE                 "${PNR_OUT_DIR}/${design(TOPLEVEL)}.spef"
set TEMPUS_RPT_DIR            "${WORK_DIR}/export/Innovus_Data/reports/tempus_signoff"
file mkdir $TEMPUS_RPT_DIR
set_db timing_analysis_type ocv
set_db timing_analysis_cppr both
set_db delaycal_enable_si true
puts "INFO: Loading MMMC View Definitions..."
read_mmmc $MMMC_FILE
#@ Begin verbose source (pre): 
if {![info exists INCLUDE_DFT]} {
set INCLUDE_DFT "false"
}
set WORK_DIR "/home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data"
set SDC_FUNC_FILE "${WORK_DIR}/inputs/new_counter.sdc"
set SDC_TEST_FILE "${WORK_DIR}/inputs/counter_dft.sdc"
set LIB_TC        "${WORK_DIR}/libraries/libs/tcbn65lptc.lib"
set LIB_WC        "${WORK_DIR}/libraries/libs/tcbn65lpwc.lib"
set LIB_BC        "${WORK_DIR}/libraries/libs/tcbn65lpbc.lib"
set CAPTABLE_TC   "${WORK_DIR}/inputs/mmmc_files/captable/cln65lp_1p09m+alrdl_top2_typical.captable"
set CAPTABLE_WC   "${WORK_DIR}/inputs/mmmc_files/captable/cln65lp_1p09m+alrdl_top2_rcworst.captable"
set CAPTABLE_BC   "${WORK_DIR}/inputs/mmmc_files/captable/cln65lp_1p09m+alrdl_top2_rcbest.captable"
create_library_set -name tc_libset -timing $LIB_TC
create_library_set -name wc_libset -timing $LIB_WC
create_library_set -name bc_libset -timing $LIB_BC
create_timing_condition -name tc_cond -library_sets {tc_libset}
create_timing_condition -name wc_cond -library_sets {wc_libset}
create_timing_condition -name bc_cond -library_sets {bc_libset}
create_rc_corner -name rc_typical -temperature 25  -cap_table $CAPTABLE_TC
create_rc_corner -name rc_worst   -temperature 125 -cap_table $CAPTABLE_WC
create_rc_corner -name rc_best    -temperature -40 -cap_table $CAPTABLE_BC
create_constraint_mode -name func_mode -sdc_files $SDC_FUNC_FILE
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
#@ End verbose source: /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/inputs/mmmc_master.view
puts "INFO: Reading Technology LEFs..."
read_physical -lef $LEF_FILE
puts "INFO: Reading Post-Route Netlist..."
read_netlist $NETLIST_FILE?62;
c?62;
read_netlist $NETLIST_FILE
init_design
read_spef -rc_corner rc_worst $SPEF_FILE
read_spef -rc_corner rc_best $SPEF_FILE
read_spef -rc_corner rc_typical $SPEF_FILE
set_analysis_view -setup {view_func_setup} -hold {view_func_hold}
update_timing -full
report_timing_summary > ${TEMPUS_RPT_DIR}/summary.rpt
report_timing -late  -max_paths 10 > ${TEMPUS_RPT_DIR}/setup_paths.rpt
report_timing -early -max_paths 10 > ${TEMPUS_RPT_DIR}/hold_paths.rpt
report_constraint -drv_violation_type {max_capacitance max_transition max_fanout} > ${TEMPUS_RPT_DIR}/drv.rpt
reset_servers
