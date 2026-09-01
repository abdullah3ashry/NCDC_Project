// 1. Set the log file to record the output
set log file lec_run.log -replace

// 2. Read the Standard Cell Library (Requires your specific .lib or .v path)
// You MUST update this path to match the TSMC 65nm library used in your lab
read library -statetable -verilog /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/libraries/v/tcbn65lp.v -both

// 3. Read the Golden Design (Front-End Synthesis Netlist)
// Update this path to your synthesized netlist
read design /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Synthesis_Data/netlists/counter_physical_synth.v -verilog -golden

// 4. Read the Revised Design (Innovus Backend Netlist)
// Update this path to your _placed.v, _cts.v, or _routed.v netlist
read design /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Innovus_Data/outputs/pnr/counter_routed.v -verilog -revised

// 5. Define the top-level module name for both designs
set root module counter -both

// 6. Transition from Setup Mode to Logic Equivalence Checking (LEC) Mode
set system mode lec

// 7. Map the key points (Flip-flops, inputs, outputs) between the two designs
add compared points -all

// 8. Run the mathematical comparison
compare

// 9. Generate the final reports
report verification -compare_result
report unmapped points
