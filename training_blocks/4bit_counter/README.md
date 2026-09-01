# 4-Bit Synchronous Up-Counter: ASIC Synthesis & Verification

## Overview
This repository contains the RTL design, physical synthesis, formal verification, and Design for Test (DFT) implementation of a 4-bit synchronous up-counter. The project demonstrates a comprehensive front-end ASIC design flow using industry-standard Cadence EDA tools and the TSMC 65nm standard cell library. 

The flow progresses from behavioral Verilog to a physically-aware gate-level netlist, incorporating Multi-Mode Multi-Corner (MMMC) timing analysis, logic equivalence checking, and scan-chain insertion.

---

## Toolchain & Technology
*   **RTL Simulation & GLS:** Cadence Xcelium (23.09) & SimVision
*   **Logical & Physical Synthesis:** Cadence Genus (21.18)
*   **Formal Verification (LEC):** Cadence Conformal (23.10)
*   **Technology Node:** TSMC 65nm Low Power (tcbn65lp)

---

## Project Structure
*   `sourcecode/rtl/` - Contains the behavioral Verilog code (`counter.v`).
*   `sourcecode/tb/` - Contains the testbench (`counter_tb.v`), which includes a custom physical delay tracker for Gate-Level Simulation (GLS) using IEEE standard VCD dumping.
*   `scripts/` - Contains the master TCL scripts (`genus_script.tcl`) used to drive the Genus synthesis engine.
*   `libraries/` - Contains the TSMC 65nm `.lib`, `.lef`, and `.captable` files required for physical synthesis.
*   `export/Synthesis_Data/` - Contains the generated handoff files:
    *   `netlists/` - Gate-level Verilog netlists (Logical, Physical, and DFT).
    *   `outputs/` - Timing databases (`.sdf`), Scan-chain topologies (`.scandef`), and Conformal scripts (`.do`).
    *   `reports/` - Detailed PPA (Power, Performance, Area) and timing reports.

---

## Design Flow & Execution

### 1. Synthesis (Cadence Genus)
The synthesis pipeline transforms the RTL into an optimized gate-level netlist. The flow explores both ideal logic and physical realities:
*   **Logical Synthesis:** Optimizes boolean logic algebraically assuming ideal `ZeroWireload` conditions.
*   **Physical Synthesis:** Introduces `.lef` and `.captable` data to route standard cells on a virtual floorplan, accounting for true RC parasitics under a Worst-Case corner (125°C, 1.08V). 
*   **Constraint Variations Analyzed:**
    *   *Baseline:* 10.0 ns clock period, 0.01 pF output load.
    *   *Performance Push:* 2.0 ns clock period, pushing the library to higher drive-strength cells.
    *   *Heavy Environment:* 10.0 ns clock with a massive 0.1 pF output load and degraded input transitions.

### 2. Formal Verification / LEC (Cadence Conformal)
Mathematical Boolean proofs are used to verify that aggressive synthesis optimizations (like redundant gate deletion or flop cloning) did not break the functional truth table of the design.
*   **RTL vs. Mapped:** Proves Genus correctly understood the Verilog behavior during standard cell translation.
*   **Mapped vs. Optimized:** Proves that power/area footprint optimizations did not alter functionality.

### 3. Design for Test / DFT (Cadence Genus)
To ensure post-manufacturing structural verification, the baseline flip-flops are replaced with Scan Flip-Flops (`SDFCNQD1`) and stitched into a serial scan chain. 
*   **Dual-Mode Operation:** Configured via the `scan_enable` (SE) pin.
*   **MMMC Timing:** Evaluates both `view_func_setup` (mission mode) and `view_test_setup` (relaxed shift mode) simultaneously to ensure test hardware does not create timing bottlenecks.

---

## How to Run

**1. RTL / Gate-Level Simulation**
Execute the headless Xcelium simulation using standard VCD dumping to avoid proprietary SHM database crashes at Time 0:
```bash
xrun -timescale 1ns/1ps \
  <path_to_netlist> \
  sourcecode/tb/counter_tb.v \
  -v libraries/v/tcbn65lp.v \
  -access +rwc \
  -define SDF_TEST \
  -maxdelay -notimingchecks \
  +pulse_r/0 +pulse_e/0 \
  -run
```
**2. Synthesis**
Execute the master TCL script inside the Genus shell:
```bash

genus -files scripts/genus_script.tcl
```
**3. Formal Verification**
Run the generated .do files through Conformal in Low-Power (-lp) mode:
```bash

lec -lp -dofile export/Synthesis_Data/outputs/mapped_to_opt.do -nogui
```
