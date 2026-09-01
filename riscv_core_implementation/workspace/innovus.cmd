#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Aug 12 06:49:03 2026                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.18-s099_1 (64bit) 07/18/2023 13:03 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.18-s099_1 NR230707-1955/21_18-UB (database version 18.20.605) {superthreading v2.17}
#@(#)CDS: AAE 21.18-s017 (64bit) 07/18/2023 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.18-s022_1 () Jul 11 2023 23:10:24 ( )
#@(#)CDS: SYNTECH 21.18-s010_1 () Jul  5 2023 06:32:03 ( )
#@(#)CDS: CPE v21.18-s053
#@(#)CDS: IQuantus/TQuantus 21.1.1-s966 (64bit) Wed Mar 8 10:22:20 PST 2023 (Linux 3.10.0-693.el7.x86_64)

set WORK_DIR                  "/home/cc/Documents/Abdullah/RISCV_synthesis"
set design(TOPLEVEL)          "riscv_core"
set INNOVUS_DATA_DIR          "${WORK_DIR}/export/Innovus_Data"
set design(export_dir)        "${INNOVUS_DATA_DIR}/outputs"
set design(reports_dir)       "${INNOVUS_DATA_DIR}/reports"
file mkdir $INNOVUS_DATA_DIR \
           ${design(export_dir)}/pnr \
           ${design(reports_dir)}/verify \
           ${design(reports_dir)}/signoff \
           ${design(reports_dir)}/placement \
           ${design(reports_dir)}/opt \
           ${design(reports_dir)}/cts \
           ${design(reports_dir)}/route
set design(postsyn_netlist)   "${WORK_DIR}/export/Synthesis_Data/netlists/${design(TOPLEVEL)}_physical_synth.v"
set design(mmmc_view_file)    "${WORK_DIR}/inputs/mmmc_master.view"
set tech(ALL_LEFS)            [list "${WORK_DIR}/libraries/lef/tcbn65lp_9lmT2.lef"]
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
puts "INFO: Starting Stage - Initialization"
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
set WORK_DIR "/home/cc/Documents/Abdullah/RISCV_synthesis"
set SDC_FUNC_FILE "${WORK_DIR}/inputs/riscv_baseline.sdc"
set SDC_TEST_FILE "${WORK_DIR}/inputs/riscv_dft.sdc"
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
#@ End verbose source: /home/cc/Documents/Abdullah/RISCV_synthesis/inputs/mmmc_master.view
read_physical -lef $tech(ALL_LEFS)
read_netlist $design(postsyn_netlist)
init_design
connect_global_net $design(digital_gnd) -pin $tech(STANDARD_CELL_GND) -all -verbose
connect_global_net $design(digital_vdd) -pin $tech(STANDARD_CELL_VDD) -all -verbose
connect_global_net $design(digital_vdd) -type tiehi -all -verbose
connect_global_net $design(digital_gnd) -type tielo -all -verbose
puts "INFO: Starting Stage - Floorplanning"
create_floorplan -core_size {350.0 350.0 20.0 20.0 20.0 20.0} \
                 -core_margins_by die \
                 -floorplan_origin center \
                 -site core \
                 -match_to_site \
                 -flip s
editPin -fixOverlap 1 -unit TRACK -spreadDirection clockwise -side Top -layer M3 -spreadType center -pin *
puts "INFO: Starting Stage - Power Planning"
set m6_name [get_db [lindex [get_db layers] 6] .name]
set m7_name [get_db [lindex [get_db layers] 7] .name]
add_rings -type core_rings \
          -nets $design(core_ring_nets) \
          -follow core \
          -layer "top $m7_name bottom $m7_name left $m6_name right $m6_name" \
          -width 5.4 \
          -spacing 3.6 \
          -offset 0.9 \
          -center 1 \
          -threshold 0 \
          -jog_distance 0 \
          -snap_wire_center_to_grid none
puts "INFO: Core Rings Created Successfully on M6/M7!"
set_db route_special_via_connect_to_shape { stripe }
route_special -nets { VDD VSS } \
              -connect {block_pin core_pin floating_stripe} \
              -layer_change_range { M1(1) M9(9) } \
              -block_pin_target nearest_target \
              -core_pin_target first_after_row_end \
              -floating_stripe_target {block_ring ring stripe ring_pin block_pin followpin} \
              -core_pin_check_stdcell_geometry \
              -allow_jogging 1 \
              -crossover_via_layer_range { M1(1) M9(9) } \
              -allow_layer_change 1 \
              -block_pin use_lef \
              -target_via_layer_range { M1(1) M9(9) }
puts "INFO: Standard Cell Power Routing Completed Successfully!"
set_db add_endcaps_right_edge $tech(ENDCAPS_right)
set_db add_endcaps_left_edge  $tech(ENDCAPS_left)
add_endcaps -prefix ENDCAP
add_stripes -nets "$design(digital_gnd) $design(digital_vdd)" \
            -direction vertical \
            -layer M4 \
            -width 0.9 \
            -spacing 0.8 \
            -set_to_set_distance 4.6 \
            -start_from left \
            -start_offset 0.9
puts "INFO: Vertical Power Stripes Generated Successfully on M4!"
puts "INFO: Starting Stage - Placement"
set_db place_global_cong_effort auto
set_db place_global_max_density 0.2
place_opt_design -report_dir "$design(reports_dir)/placement/place_opt_design"
check_place
delete_routes -type regular 
set_db add_tieoffs_prefix "TIE"
set_db add_tieoffs_cells "$tech(TIEHI) $tech(TIELO)"
set_db add_tieoffs_max_fanout $tech(TIE_MAX_FANOUT)
add_tieoffs
opt_design -pre_cts -drv -setup -report_dir "$design(reports_dir)/opt/pre_cts"
write_netlist ${design(export_dir)}/pnr/${design(TOPLEVEL)}_placed.v
puts "INFO: Starting Stage - Clock Tree Synthesis"
create_clock_tree_spec
ccopt_design -report_dir "$design(reports_dir)/cts/ccopt_design"
