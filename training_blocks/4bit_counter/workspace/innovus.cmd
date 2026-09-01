#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Aug  6 01:58:37 2026                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.18-s099_1 (64bit) 07/18/2023 13:03 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.18-s099_1 NR230707-1955/21_18-UB (database version 18.20.605) {superthreading v2.17}
#@(#)CDS: AAE 21.18-s017 (64bit) 07/18/2023 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.18-s022_1 () Jul 11 2023 23:10:24 ( )
#@(#)CDS: SYNTECH 21.18-s010_1 () Jul  5 2023 06:32:03 ( )
#@(#)CDS: CPE v21.18-s053
#@(#)CDS: IQuantus/TQuantus 21.1.1-s966 (64bit) Wed Mar 8 10:22:20 PST 2023 (Linux 3.10.0-693.el7.x86_64)

set WORK_DIR                  "/home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data"
set INNOVUS_DATA_DIR          "${WORK_DIR}/export/Innovus_Data"
set design(export_dir)        "${INNOVUS_DATA_DIR}/outputs"
set design(reports_dir)       "${INNOVUS_DATA_DIR}/reports"
file mkdir $INNOVUS_DATA_DIR \
           ${design(export_dir)}/pnr \
           ${design(reports_dir)}/verify \
           ${design(reports_dir)}/signoff
set design(postsyn_netlist)   "${WORK_DIR}/export/Synthesis_Data/netlists/${design(TOPLEVEL)}_physical_synth.v"
set design(mmmc_view_file)    "${WORK_DIR}/inputs/mmmc_master.view"
set design(io_file)           "${WORK_DIR}/inputs/${design(TOPLEVEL)}.io"
set tech(ALL_LEFS)            "${WORK_DIR}/libraries/lef/tcbn65lp_9lmT2.lef"
set tech(STANDARD_CELL_VDD)   "VDD"
set tech(STANDARD_CELL_GND)   "VSS"
set tech(ENDCAPS_right)       "DCAP"    
set tech(ENDCAPS_left)        "DCAP"
set tech(TIEHI)               "TIEH"
set tech(TIELO)               "TIEL"
set tech(TIE_MAX_FANOUT)      10
set tech(DECAP)               "DCAP64 DCAP32 DCAP16 DCAP8 DCAP4 DCAP"
set tech(FILLERS)             "FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1"
set design(digital_gnd)       "VSS"
set design(digital_vdd)       "VDD"
set design(all_ground_nets)   $design(digital_gnd)
set design(all_power_nets)    $design(digital_vdd)
set design(core_ring_nets)    "$design(digital_gnd) $design(digital_vdd)"
set_library_unit -time 1ns -cap 1pf
set_db timing_analysis_type ocv
set_db timing_analysis_cppr both
set_db timing_report_unconstrained_paths true
set_db init_ground_nets $design(all_ground_nets)
set_db init_power_nets  $design(all_power_nets)
read_mmmc $design(mmmc_view_file) 
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
read_physical -lef $tech(ALL_LEFS)
read_netlist $design(postsyn_netlist)?62;
read_netlist $design(postsyn_netlist)
read_netlist $design(postsyn_netlist)
set design(postsyn_netlist)   "${WORK_DIR}/export/Synthesis_Data/netlists/${design(TOPLEVEL)}_physical_synth.v"
set design(TOPLEVEL)          "counter"
set design(postsyn_netlist)   "${WORK_DIR}/export/Synthesis_Data/netlists/${design(TOPLEVEL)}_physical_synth.v"
init_design
set design(TOPLEVEL)          "counter"
set design(postsyn_netlist)   "${WORK_DIR}/export/Synthesis_Data/netlists/${design(TOPLEVEL)}_physical_synth.v"
read_netlist $design(postsyn_netlist)
set design(TOPLEVEL)          "counter"
set design(postsyn_netlist)   "${WORK_DIR}/export/Synthesis_Data/netlists/${design(TOPLEVEL)}_physical_synth.v"
read_netlist $design(postsyn_netlist)
read_mmmc $design(mmmc_view_file) 
read_physical -lef $tech(ALL_LEFS)
exit
