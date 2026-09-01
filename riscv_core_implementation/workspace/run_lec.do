# ==============================================================================
# CADENCE CONFORMAL LEC: LOGICAL EQUIVALENCE CHECKING SCRIPT
# Golden Design: Post-Synthesis Netlist (or RTL)
# Revised Design: Post-Route Final Netlist (riscv_core.final.v)
# ==============================================================================

# 1. Setup the Tool Mode
set system mode setup

# 2. Load the TSMC 65nm Technology Libraries (Liberty format)
read_library -liberty "/home/cc/Documents/Abdullah/RISCV_synthesis/libraries/libs/tcbn65lpwc.lib"

# 3. Read the GOLDEN Design (Reference: Post-Synthesis Netlist)
read_design -verilog -golden "/home/cc/Documents/Abdullah/RISCV_synthesis/export/Synthesis_Data/netlists/riscv_core_physical_synth.v"

# 4. Read the REVISED Design (Target: Final Post-Route Netlist)
read_design -verilog -revised "/home/cc/Documents/Abdullah/RISCV_synthesis/export/Innovus_Data/outputs/pnr/riscv_core.final.v"

# 5. Set the Top-Level Module Name
set top module riscv_core

# 6. Map the Design Points (Compare Points)
set system mode lec

# Add comparison mappings automatically based on pin/net names
add_compared_points -all

# 7. Execute the Equivalence Comparison
compare

# 8. Generate Summary Reports
report_compared_points > /home/cc/Documents/Abdullah/RISCV_synthesis/export/Innovus_Data/reports/verify/lec_compared_points.rpt
report_unmapped_points > /home/cc/Documents/Abdullah/RISCV_synthesis/reports/verify/lec_unmapped_points.rpt

# Exit tool
exit
