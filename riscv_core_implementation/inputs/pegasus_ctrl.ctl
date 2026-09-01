// ==============================================================================
// MASTER PVS LVS CONTROL FILE (.ctl) FOR RISC-V CORE
// ==============================================================================

// 1. GENERAL LVS SETTINGS & DEBUGGING
LVS_REPORT_FILE "lvs.rep";
LVS_REPORT_MAX 1000;
LVS_FIND_SHORTS yes;
LVS_EXPAND_CELL_ON_ERROR no;
LVS_RECOGNIZE_GATES -none;

// 2. PORT & TEXT RULES
TEXT_DEPTH -primary;
LVS_IGNORE_PORTS yes;
LVS_COMPARE_PORT_NAMES yes;

// 3. VIRTUAL CONNECTIONS (Power/Ground Netting)
VIRTUAL_CONNECT -colon yes;
VIRTUAL_CONNECT -semicolon_as_colon yes;
VIRTUAL_CONNECT -report no;
VIRTUAL_CONNECT -depth -primary;

// 4. LAYOUT SETTINGS (GDSII - Physical Design)
LAYOUT_FORMAT gdsii;
LAYOUT_PRIMARY "riscv_core";
LAYOUT_PATH "/home/cc/Documents/Abdullah/RISCV_synthesis/export/Innovus_Data/outputs/pnr/riscv_core.gds";

// 5. SCHEMATIC SETTINGS (Netlist / Logical Design)
SCHEMATIC_PRIMARY "riscv_core";
SCHEMATIC_PATH "/home/cc/Documents/Abdullah/RISCV_synthesis/export/Innovus_Data/outputs/pnr/riscv_core.final.v" verilog;

// Standard Cell SPICE / CDL libraries for TSMC 65nm
SCHEMATIC_PATH "/home/cc/Documents/Abdullah/RISCV_synthesis/libraries/spi/tcbn65lp_200a.spi" spice;

// 6. PHYSICAL CELLS FILTERING (Fillers & Decaps added during P&R)
LVS_DELETE_CELL DCAP -layout;
LVS_DELETE_CELL DCAP4 -layout;
LVS_DELETE_CELL DCAP8 -layout;
LVS_DELETE_CELL DCAP16 -layout;
LVS_DELETE_CELL DCAP32 -layout;
LVS_DELETE_CELL DCAP64 -layout;

LVS_DELETE_CELL FILL1 -layout;
LVS_DELETE_CELL FILL2 -layout;
LVS_DELETE_CELL FILL4 -layout;
LVS_DELETE_CELL FILL8 -layout;
LVS_DELETE_CELL FILL16 -layout;
LVS_DELETE_CELL FILL32 -layout;
LVS_DELETE_CELL FILL64 -layout;
