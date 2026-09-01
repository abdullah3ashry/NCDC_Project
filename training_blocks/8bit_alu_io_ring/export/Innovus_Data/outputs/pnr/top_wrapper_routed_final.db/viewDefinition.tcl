if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name bc_libset\
   -timing\
    [list ${::IMEX::libVar}/mmmc/tcbn65lpbc.lib\
    ${::IMEX::libVar}/mmmc/tpzn65lpgv2od3bc.lib]
create_library_set -name wc_libset\
   -timing\
    [list ${::IMEX::libVar}/mmmc/tcbn65lpwc.lib\
    ${::IMEX::libVar}/mmmc/tpzn65lpgv2od3wc.lib]
create_library_set -name tc_libset\
   -timing\
    [list ${::IMEX::libVar}/mmmc/tcbn65lptc.lib\
    ${::IMEX::libVar}/mmmc/tpzn65lpgv2od3tc.lib]
create_timing_condition -name bc_cond\
   -library_sets [list bc_libset]
create_timing_condition -name tc_cond\
   -library_sets [list tc_libset]
create_timing_condition -name wc_cond\
   -library_sets [list wc_libset]
create_rc_corner -name rc_typical\
   -cap_table ${::IMEX::libVar}/mmmc/cln65lp_1p09m+alrdl_top2_typical.captable\
   -pre_route_res 1\
   -post_route_res 1\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -temperature 25
create_rc_corner -name rc_best\
   -cap_table ${::IMEX::libVar}/mmmc/cln65lp_1p09m+alrdl_top2_rcbest.captable\
   -pre_route_res 1\
   -post_route_res 1\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -temperature -40
create_rc_corner -name rc_worst\
   -cap_table ${::IMEX::libVar}/mmmc/cln65lp_1p09m+alrdl_top2_rcworst.captable\
   -pre_route_res 1\
   -post_route_res 1\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -temperature 125
create_delay_corner -name dc_worst\
   -timing_condition {wc_cond}\
   -rc_corner rc_worst
create_delay_corner -name dc_best\
   -timing_condition {bc_cond}\
   -rc_corner rc_best
create_delay_corner -name dc_typical\
   -timing_condition {tc_cond}\
   -rc_corner rc_typical
create_constraint_mode -name func_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/func_mode/func_mode.sdc]
create_analysis_view -name view_func_hold -constraint_mode func_mode -delay_corner dc_best -latency_file ${::IMEX::dataVar}/mmmc/views/view_func_hold/latency.sdc
create_analysis_view -name view_func_setup -constraint_mode func_mode -delay_corner dc_worst -latency_file ${::IMEX::dataVar}/mmmc/views/view_func_setup/latency.sdc
create_analysis_view -name view_func_typical -constraint_mode func_mode -delay_corner dc_typical -latency_file ${::IMEX::dataVar}/mmmc/views/view_func_typical/latency.sdc
set_analysis_view -setup [list view_func_setup] -hold [list view_func_setup]
