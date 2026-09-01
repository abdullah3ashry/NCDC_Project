REAd IMplementation Information fv/counter -golden fv_map -revised fv_opt
SET PARAllel Option -threads 1,4 -norelease_license
SET COmpare Options -threads 1,4
SET MUltiplier Implementation boothrca -both
SET UNDEfined Cell black_box -noascend -both
ADD SEarch Path . /home/cc/mnt/GENUS211/tools.lnx86/lib/tech -library -both
REAd LIbrary -liberty -both /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/libraries/libs/tcbn65lptc.lib\
   /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/libraries/libs/tcbn65lpwc.lib
REAd DEsign -verilog95 -golden -lastmod -noelab fv/counter/fv_map.v.gz
ELAborate DEsign -golden -root counter
REAd DEsign -verilog95 -revised -lastmod -noelab /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Synthesis_Data/netlists/counter_physical_synth.v
ELAborate DEsign -revised -root counter
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
WRIte COmpared Points noneq.compared_points.counter.fv_map.fv_opt.tcl -class noneq -tclmode -replace
ANAlyze NOnequivalent -source_diagnosis
REPort NOnequivalent Analysis
REPort TEst Vector -noneq
WRIte VErification Information
REPort VErification Information
REPort IMplementation Information
ANAlyze RESults -logfiles /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Synthesis_Data/reports/lec_mapped_to_opt.log
VERsion 23.10-s300 (30-Aug-2023) (64 bit executable)
EXIt
