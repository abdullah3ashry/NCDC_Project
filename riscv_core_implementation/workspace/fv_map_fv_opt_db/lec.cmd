REAd IMplementation Information fv/riscv_core -golden fv_map -revised fv_opt
SET PARAllel Option -threads 1,4 -norelease_license
SET COmpare Options -threads 1,4
SET MUltiplier Implementation boothrca -both
SET UNDEfined Cell black_box -noascend -both
ADD SEarch Path . /home/cc/mnt/GENUS211/tools.lnx86/lib/tech -library -both
REAd LIbrary -liberty -both /home/cc/Documents/Abdullah/RISCV_synthesis/libraries/libs/tcbn65lptc.lib\
   /home/cc/Documents/Abdullah/RISCV_synthesis/libraries/libs/tcbn65lpwc.lib
REAd DEsign -verilog95 -golden -lastmod -noelab fv/riscv_core/fv_map.v.gz
ELAborate DEsign -golden -root riscv_core
REAd DEsign -verilog95 -revised -lastmod -noelab /home/cc/Documents/Abdullah/RISCV_synthesis/export/Synthesis_Data/netlists/riscv_core_physical_synth_agg_clk.v
ELAborate DEsign -revised -root riscv_core
REPort DEsign Data
REPort BLack Box
SET FLatten Model -seq_constant
SET FLatten Model -seq_constant_x_to 0
SET FLatten Model -nodff_to_dlat_zero
SET FLatten Model -nodff_to_dlat_feedback
SET FLatten Model -hier_seq_merge
CHEck VErification Information
SET ANalyze Option -auto -report_map
SET SYstem Mode lec
REPort UNmapped Points -summary
REPort UNmapped Points -notmapped
ADD COmpared Points -all
COMpare
REPort COmpare Data -class nonequivalent -class abort -class notcompared
REPort VErification -verbose
REPort STatistics
WRIte COmpared Points noneq.compared_points.riscv_core.fv_map.fv_opt.tcl -class noneq -tclmode -replace
ANAlyze NOnequivalent -source_diagnosis
REPort NOnequivalent Analysis
REPort TEst Vector -noneq
WRIte VErification Information
REPort VErification Information
REPort IMplementation Information
ANAlyze RESults -logfiles /home/cc/Documents/Abdullah/RISCV_synthesis/export/Synthesis_Data/reports/lec_mapped_to_opt.log
EXIt
