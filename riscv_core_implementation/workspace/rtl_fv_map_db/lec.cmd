REAd IMplementation Information fv/riscv_core -revised fv_map
SET PARAllel Option -threads 1,4 -norelease_license
SET COmpare Options -threads 1,4
SET MUltiplier Implementation boothrca -both
SET UNDEfined Cell black_box -noascend -both
ADD SEarch Path . /home/cc/mnt/GENUS211/tools.lnx86/lib/tech -library -both
REAd LIbrary -liberty -both /home/cc/Documents/Abdullah/RISCV_synthesis/libraries/libs/tcbn65lptc.lib\
   /home/cc/Documents/Abdullah/RISCV_synthesis/libraries/libs/tcbn65lpwc.lib
SET UNDRiven Signal 0 -golden
SET NAming Style genus -golden
SET NAming Rule %s[%d] -instance_array -golden
SET NAming Rule %s_reg -register -golden
SET NAming Rule %L.%s %L[%d].%s %s -instance -golden
SET NAming Rule %L.%s %L[%d].%s %s -variable -golden
SET NAming Rule -ungroup_separator _ -golden
SET HDl Options -const_port_extend
SET HDl Options -unsigned_conversion_overflow on
SET HDl Options -v_to_vd on
SET HDl Options -VERILOG_INCLUDE_DIR sep:src
ADD SEarch Path . -design -golden
REAd DEsign -enumconstraint -define SYNTHESIS -merge bbox -golden -lastmod -noelab -sv09 /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/alu.sv\
   /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/alu_ctrl.sv /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/branch_comp.sv\
   /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/data_mem_ctrl.sv /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/imm_gen.sv\
   /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/main_ctrl.sv /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/program_counter.sv\
   /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/reg_file.sv /home/cc/Documents/Abdullah/RISCV_synthesis/sourcecode/rtl/riscv_core.sv
ELAborate DEsign -golden -root riscv_core -rootonly
REAd DEsign -verilog95 -revised -lastmod -noelab fv/riscv_core/fv_map.v.gz
ELAborate DEsign -revised -root riscv_core
UNIQuify -all -nolib -golden
REPort DEsign Data
REPort BLack Box
SET FLatten Model -seq_constant
SET FLatten Model -seq_constant_x_to 0
SET FLatten Model -nodff_to_dlat_zero
SET FLatten Model -nodff_to_dlat_feedback
SET FLatten Model -hier_seq_merge
SET FLatten Model -balanced_modeling
CHEck VErification Information
SET ANalyze Option -auto -report_map
WRIte HIer_compare Dofile hier_tmp2.lec.do -verbose -noexact_pin_match -constraint -usage -replace -balanced_extraction\
   -input_output_pin_equivalence -prepend_string "report_design_data; report_unmapped_points -summary; report_unmapped_points -notmapped; analyze_datapath -module -verbose; eval analyze_datapath -flowgraph -verbose"
RUN HIer_compare hier_tmp2.lec.do -dynamic_hierarchy
REPort HIer_compare Result -dynamicflattened
REPort VErification -hier -verbose
SET SYstem Mode lec
WRIte COmpared Points noneq.compared_points.riscv_core.rtl.fv_map.tcl -class noneq -tclmode -replace
ANAlyze NOnequivalent -source_diagnosis
REPort NOnequivalent Analysis
REPort TEst Vector -noneq
SET SYstem Mode setup
WRIte VErification Information
REPort VErification Information
REPort IMplementation Information
SET SYstem Mode lec
ANAlyze RESults -logfiles /home/cc/Documents/Abdullah/RISCV_synthesis/export/Synthesis_Data/reports/lec_rtl_to_mapped.log
EXIt
