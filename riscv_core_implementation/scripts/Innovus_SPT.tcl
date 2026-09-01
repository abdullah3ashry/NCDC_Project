################################################################################
# CADENCE INNOVUS: FLAT PLACE & ROUTE SCRIPT (CORE ONLY)
# Design: riscv_core
# Technology: TSMC 65nm (9-Layer Metal Stack)
################################################################################

# ==============================================================================
# 1. PROJECT VARIABLES & SETUP
# ==============================================================================

set WORK_DIR                  "/home/cc/Documents/Abdullah/RISCV_synthesis"
set design(TOPLEVEL)          "riscv_core"

# --- Output Infrastructure & Directory Creation ---
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

# --- Inputs ---
set design(postsyn_netlist)   "${WORK_DIR}/export/Synthesis_Data/netlists/${design(TOPLEVEL)}_physical_synth.v"
set design(mmmc_view_file)    "${WORK_DIR}/inputs/mmmc_master.view"

# Core LEF only (No IO Pads)
set tech(ALL_LEFS)            [list "${WORK_DIR}/libraries/lef/tcbn65lp_9lmT2.lef"]

# --- Cell Library Definitions ---
set tech(STANDARD_CELL_VDD)   "VDD"
set tech(STANDARD_CELL_GND)   "VSS"
set tech(ENDCAPS_right)       "DCAP"    
set tech(ENDCAPS_left)        "DCAP"
set tech(TIEHI)               "TIEH"
set tech(TIELO)               "TIEL"
set tech(TIE_MAX_FANOUT)      10
set tech(DECAP)               "DCAP64 DCAP32 DCAP16 DCAP8 DCAP4 DCAP"
set tech(FILLERS)             "FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1"

# --- Global Net Definitions ---
set design(digital_gnd)       "VSS"
set design(digital_vdd)       "VDD"
set design(all_ground_nets)   $design(digital_gnd)
set design(all_power_nets)    $design(digital_vdd)
set design(core_ring_nets)    "$design(digital_gnd) $design(digital_vdd)"

# ==============================================================================
# 2. TOOL SETTINGS & INITIALIZATION
# ==============================================================================
puts "INFO: Starting Stage - Initialization"

set_library_unit -time 1ns -cap 1pf
set_db timing_analysis_type ocv
set_db timing_analysis_cppr both
set_db timing_report_unconstrained_paths true

set_db init_ground_nets $design(all_ground_nets)
set_db init_power_nets  $design(all_power_nets)

read_mmmc $design(mmmc_view_file) 
read_physical -lef $tech(ALL_LEFS)
read_netlist $design(postsyn_netlist)

init_design

connect_global_net $design(digital_gnd) -pin $tech(STANDARD_CELL_GND) -all -verbose
connect_global_net $design(digital_vdd) -pin $tech(STANDARD_CELL_VDD) -all -verbose
connect_global_net $design(digital_vdd) -type tiehi -all -verbose
connect_global_net $design(digital_gnd) -type tielo -all -verbose

# ==============================================================================
# 3. FLOORPLANNING & PIN PLACEMENT
# ==============================================================================
puts "INFO: Starting Stage - Floorplanning"

# Calculate margins relative to the DIE since there are no IO pads
create_floorplan -core_size {350.0 350.0 20.0 20.0 20.0 20.0} \
                 -core_margins_by die \
                 -floorplan_origin center \
                 -site core \
                 -match_to_site \
                 -flip s

set all_pins [get_db ports .name]
set num_pins [llength $all_pins]
set pins_per_side [expr {$num_pins / 4}]

set top_pins    [lrange $all_pins 0 [expr {$pins_per_side - 1}]]
set bottom_pins [lrange $all_pins $pins_per_side [expr {($pins_per_side * 2) - 1}]]
set left_pins   [lrange $all_pins [expr {$pins_per_side * 2}] [expr {($pins_per_side * 3) - 1}]]
set right_pins  [lrange $all_pins [expr {$pins_per_side * 3}] end]

edit_pin -fixed_pin -pin $top_pins    -side top    -layer 3 -spread_type center -spacing 2
edit_pin -fixed_pin -pin $bottom_pins -side bottom -layer 3 -spread_type center -spacing 2
edit_pin -fixed_pin -pin $left_pins   -side left   -layer 4 -spread_type center -spacing 2
edit_pin -fixed_pin -pin $right_pins  -side right  -layer 4 -spread_type center -spacing 2



# ==============================================================================
# 4. POWER PLANNING (PNS)
# ==============================================================================
puts "INFO: Starting Stage - Power Planning"

set m6_name [get_db [lindex [get_db layers] 6] .name]
set m7_name [get_db [lindex [get_db layers] 7] .name]

# --- 4.1 Core Power Rings ---
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

# --- 4.2 Power Routing (Follow Pins to Core Rings) ---
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

# --- 4.3 Endcaps & Vertical Power Stripes ---
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

# ==============================================================================
# 5. PLACEMENT
# ==============================================================================
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

# ==============================================================================
# 6. CLOCK TREE SYNTHESIS (CTS)
# ==============================================================================
puts "INFO: Starting Stage - Clock Tree Synthesis"

create_clock_tree_spec
ccopt_design -report_dir "$design(reports_dir)/cts/ccopt_design"

opt_design -post_cts -setup -hold -drv -report_dir "$design(reports_dir)/opt/post_cts"
write_netlist ${design(export_dir)}/pnr/${design(TOPLEVEL)}_cts.v

# ==============================================================================
# 7. ROUTING
# ==============================================================================
puts "INFO: Starting Stage - Detailed Routing"

set_db delaycal_enable_si true
set_db route_design_with_timing_driven true
set_db route_design_with_si_driven true
set_db route_design_with_eco true

route_opt_design

opt_design -post_route -setup -hold -drv -report_dir "$design(reports_dir)/opt/post_route"
write_netlist ${design(export_dir)}/pnr/${design(TOPLEVEL)}_routed.v

# ==============================================================================
# 8. DESIGN FOR MANUFACTURING (DFM)
# ==============================================================================
puts "INFO: Starting Stage - DFM Optimizations"

set_db route_design_with_timing_driven false
set_db route_design_with_si_driven false
set_db route_design_with_eco false

set_db route_design_detail_post_route_spread_wire true
set_db route_design_detail_use_multi_cut_via_effort high

route_design -via_opt
route_design -wire_opt

set_db route_design_detail_post_route_spread_wire false
set_db route_design_with_timing_driven true
set_db route_design_with_si_driven true
set_db route_design_with_eco true

# ==============================================================================
# 9. PHYSICAL CONTINUITY (FILLER INSERTION)
# ==============================================================================
puts "INFO: Starting Stage - Filler Insertion"

set_db add_fillers_prefix FILLDECAP
set_db add_fillers_cells [concat $tech(DECAP) $tech(FILLERS)]
add_fillers

route_eco -fix_drc
edit_trim_routes -all       
delete_empty_hinst          

# ==============================================================================
# 10. VERIFICATION & POWER ANALYSIS
# ==============================================================================
puts "INFO: Starting Stage - Verification"

check_drc -out_file "$design(reports_dir)/verify/drc_violations.rpt"
check_connectivity -type all -out_file "$design(reports_dir)/verify/connectivity.rpt"

set_power_output_dir -reset
set_default_switching_activity -reset
set_power -reset
set_power_output_dir ./
set_default_switching_activity -input_activity 0.2 -period 10.0
report_power -rail_analysis_format VS -out_file "$design(reports_dir)/verify/power_report.rpt"

# ==============================================================================
# 11. SIGNOFF STA (TEMPUS)
# ==============================================================================
puts "INFO: Starting Stage - Signoff Timing"

set_analysis_view -setup {view_func_setup} -hold {view_func_hold}
time_design -post_route -report_dir $design(reports_dir)/signoff/setup
time_design -post_route -hold -report_dir $design(reports_dir)/signoff/hold

# ==============================================================================
# 12. FINAL EXPORT (HANDOFF)
# ==============================================================================
puts "INFO: Starting Stage - Data Export"

write_netlist ${design(export_dir)}/pnr/${design(TOPLEVEL)}.final.v -exclude_leaf_cells

set_db extract_rc_coupled true
extract_rc
write_parasitics -spef_file ${design(export_dir)}/pnr/${design(TOPLEVEL)}.spef

write_lef_abstract ${design(export_dir)}/pnr/${design(TOPLEVEL)}_macro.lef -stripe_pins

set_analysis_view -setup {view_func_setup} -hold {view_func_setup}
write_timing_model ${design(export_dir)}/pnr/${design(TOPLEVEL)}_macro.lib -view view_func_setup

write_db ${design(export_dir)}/pnr/${design(TOPLEVEL)}_routed_final.db

# Merge only the standard cell GDS for a core-level macro export
write_stream ${design(export_dir)}/pnr/${design(TOPLEVEL)}.gds \
  -unit 1000 \
  -mode ALL \
  -merge "${WORK_DIR}/libraries/gds/tcbn65lp.gds" \
  -map_file "${WORK_DIR}/libraries/map/PRTF_EDI_N65_gdsout_6X1Z1U.24a.map" 

puts "INFO: Place and Route Flow Completed Successfully!"
gui_fit
