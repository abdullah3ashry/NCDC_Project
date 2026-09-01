// ==============================================================================
// MASTER PVS LVS CONTROL FILE (.ctl)
// Description: This file provides instructions to the PVS LVS tool on how to 
// compare the physical Layout (GDS) with the logical Schematic (Verilog netlist).
// ==============================================================================

// ------------------------------------------------------------------------------
// 1. GENERAL LVS SETTINGS & DEBUGGING
// ------------------------------------------------------------------------------
// This section controls the report generation and basic LVS debugging behavior.

LVS_REPORT_FILE "lvs.rep";               // Specifies the name of the final LVS text report file.
LVS_REPORT_MAX 1000;                     // Stops reporting after 1000 errors to prevent the report file from becoming excessively large.
LVS_FIND_SHORTS yes;                     // VERY IMPORTANT! Instructs the tool to find and report any short circuits (e.g., between Power/VDD and Ground/VSS).
LVS_EXPAND_CELL_ON_ERROR no;             // Prevents the tool from flattening (expanding) standard cells if an error occurs. This keeps the error log hierarchical and easier to debug.
LVS_RECOGNIZE_GATES -none;               // Disables transistor-level gate recognition. In a digital RTL-to-GDS flow, we compare Standard Cells directly instead of individual transistors.

// ------------------------------------------------------------------------------
// 2. PORT & TEXT RULES
// ------------------------------------------------------------------------------
// This section defines how the tool reads text labels and pins in the layout.

TEXT_DEPTH -primary;                     // Restricts the tool to only read text labels placed at the top-level cell, ignoring internal text of standard cells.
LVS_IGNORE_PORTS yes;                    // In digital PNR, top-level power/ground nets often lack physical "Pin" geometries. This command ignores the missing pin shapes as long as the routing nets are correctly connected.
LVS_COMPARE_PORT_NAMES yes;              // Strictly enforces that the port names in the Layout exactly match the port names in the Schematic (e.g., 'clk' matches 'clk').

// ------------------------------------------------------------------------------
// 3. VIRTUAL CONNECTIONS (Power/Ground Netting)
// ------------------------------------------------------------------------------
// Sometimes layout power/ground nets (like two separate VDD rings) are not physically 
// connected by metal. These commands tell the tool to treat them as logically connected.

VIRTUAL_CONNECT -colon yes;              // Logically connects nets that share the same prefix before a colon (e.g., VDD:1 is virtually connected to VDD:2).
VIRTUAL_CONNECT -semicolon_as_colon yes; // Treats semicolons (;) exactly like colons (:) for virtual connections.
VIRTUAL_CONNECT -report no;              // Suppresses the printing of virtual connections in the report to keep the log clean.
VIRTUAL_CONNECT -depth -primary;         // Applies virtual connections only at the top-level hierarchy, not inside sub-cells.

// ------------------------------------------------------------------------------
// 4. LAYOUT SETTINGS (GDSII - Physical Design)
// ------------------------------------------------------------------------------
// Tells the tool where to find the physical layout data (the drawn masks).

LAYOUT_FORMAT gdsii;                     // Specifies that the layout database format is GDSII (the industry standard).

// [UPDATE REQUIRED]: Change "counter" to your current top module's name.
LAYOUT_PRIMARY "top_wrapper";                

// [UPDATE REQUIRED]: Change the file path to point to your newly exported GDS file.
LAYOUT_PATH "/home/cc/Documents/Abdullah/Lab_04_Data/export/Innovus_Data/outputs/pnr/top_wrapper.gds"; 

// ------------------------------------------------------------------------------
// 5. SCHEMATIC SETTINGS (Netlist / Logical Design)
// ------------------------------------------------------------------------------
// Tells the tool where to find the logical design (Verilog) and the SPICE library.

// [UPDATE REQUIRED]: Change "counter" to your current top module's name in Verilog.
SCHEMATIC_PRIMARY "top_wrapper";             

// [UPDATE REQUIRED]: Change the file path to point to your PNR exported Verilog netlist.
SCHEMATIC_PATH "/home/cc/Documents/Abdullah/Lab_04_Data/export/Innovus_Data/outputs/pnr/top_wrapper.final.v" verilog; 

// [UPDATE REQUIRED ONLY IF TECH NODE CHANGES]: Path to the Standard Cell SPICE/CDL library.
// The Verilog netlist only contains cell names (e.g., AND2X1). This SPICE file tells the LVS tool what transistors are inside AND2X1.
SCHEMATIC_PATH "/home/cc/Documents/Abdullah/Lab_04_Data/libraries/spi/tcbn65lp_200a.spi" spice; 

SCHEMATIC_PATH "/home/cc/Documents/Abdullah/Lab_04_Data/libraries/spi/tpzn65lpgv2od3_3.spi" spice;  
  

// ------------------------------------------------------------------------------
// 6. PHYSICAL CELLS FILTERING (Dummy, Decap, Fillers)
// ------------------------------------------------------------------------------
// [EDUCATIONAL NOTE FOR STUDENTS]: 
// The PNR tool (Innovus) inserts Filler cells to meet chip density rules, and 
// Decap (Decoupling Capacitor) cells to stabilize voltage drop (IR Drop). 
// These cells exist ONLY in the physical layout (GDS) and DO NOT exist in the 
// logical Verilog netlist. 
// If we do not delete/ignore them here, LVS will fail with an "Instance Mismatch" error.
// The commands below instruct the LVS tool to temporarily ignore these physical-only cells during comparison.

// --- Decoupling Capacitor Cells Filter ---
LVS_DELETE_CELL DCAP -layout;
LVS_DELETE_CELL DCAP2 -layout;
LVS_DELETE_CELL DCAP3 -layout;
LVS_DELETE_CELL DCAP4 -layout;
LVS_DELETE_CELL DCAP8 -layout;
LVS_DELETE_CELL DCAP10 -layout;
LVS_DELETE_CELL DCAP16 -layout;
LVS_DELETE_CELL DCAP32 -layout;
LVS_DELETE_CELL DCAP64 -layout;

// --- Filler Cells Filter ---
LVS_DELETE_CELL FILL1 -layout;
LVS_DELETE_CELL FILL2 -layout;
LVS_DELETE_CELL FILL3 -layout;
LVS_DELETE_CELL FILL4 -layout;
LVS_DELETE_CELL FILL8 -layout;
LVS_DELETE_CELL FILL10 -layout;
LVS_DELETE_CELL FILL16 -layout;
LVS_DELETE_CELL FILL32 -layout;
LVS_DELETE_CELL FILL64 -layout;
