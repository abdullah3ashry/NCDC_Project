Markdown
# 🚀 32-Bit RISC-V Processor: ASIC Physical Design Flow (TSMC 65nm)

This repository contains the RTL, automation scripts, constraints, and final signoff reports for the backend physical design of a 32-bit Single-Cycle RISC-V processor core. The project was executed during an internship at the **NUST Chip Design Centre (NCDC)** using the **TSMC 65nm LP (9-Metal Layer)** technology node.

## 📌 Project Overview
The primary objective of this project was to take a behavioral SystemVerilog description of a RISC-V core through a complete, foundry-ready ASIC physical design flow. The core was implemented as a hard macro designed for top-level system and memory integration, featuring boundary I/O pin placements and a highly dense power distribution network.

*   **Technology Node:** TSMC 65nm LP (tcbn65lp)
*   **EDA Tools:** Cadence Genus (Synthesis), Cadence Innovus (PnR), Cadence Tempus (STA), Cadence Conformal (LEC), Cadence PVS (DRC/LVS).

---

## 📊 Key Implementation Metrics

| Metric | Target / Result |
| :--- | :--- |
| **Clock Frequency** | 174.52 MHz (5.73 ns Period) |
| **Core Area** | 350.0 µm × 350.0 µm |
| **Routing Completion** | 100% (10,983 Nets) |
| **Setup WNS (Tempus)** | -0.261 ns (Reg2Reg: +1.700 ns) |
| **Hold WNS (Tempus)** | -0.023 ns |
| **Total Power** | 5.41 mW |
| **Design Rule Checks (DRC)** | 0 Violations |
| **Multi-Cut Via Rate** | 79.4% (Yield Enhancement) |

---

## 🖼️ Physical Layout Highlights

### Final Routed Layout (GDSII Prototype)
*A high-density layout view showcasing standard cell placement, M2/M3 detailed routing, and filler cell insertion.*
![Final Layout](images/image_d29b34.jpg)

### Power Distribution Network (PDN)
*M6/M7 global power rings interfacing with 152 M4 vertical power stripes to prevent IR drop.*
![Power Mesh](images/PDN_Stripe_Mesh.png) *(Note: Ensure you upload your PDN screenshot to the `/images` folder)*

---

## 📂 Repository Structure

The repository has been structured to showcase the progression from foundational physical design training to the final RISC-V capstone project.

```text
├── riscv_core_implementation/        # Capstone Project
│   ├── sourcecode/                          # SystemVerilog RTL & Testbenches
│   ├── scripts/                      # TCL Scripts (Genus, Innovus, Tempus)
│   ├── inputs/                       # SDC Timing Constraints (10.0ns & 5.73ns)
│   ├── export/                       # Final Netlist (.v), SPEF, LEF, Liberty (.lib), Signoff STA, Power, DRC, and LEC summaries
│
└── training_blocks/                  # Preliminary PD Training
    ├── 4bit_counter/                 # Baseline flow & LEC verification
    └── 8bit_alu_io_ring/             # Physical I/O Pad integration (PDDW16DGZ)
```

---

## 🛠️ Design Flow Execution

**Logic Synthesis (`scripts/synthesis.tcl`)**
* Executed physical-aware synthesis (`FLOW_TYPE "physical"`) mapping generic logic to TSMC 65nm standard cells.
* Achieved 100% mathematical boolean equivalence verified via Cadence Conformal LEC.

**Floorplanning & Power Planning (`scripts/innovus_flow.tcl`)**
* Distributed 168 I/O ports evenly across M3/M4 along the die boundary.
* Generated over 47,000 multi-layer vias connecting the M6/M7 rings to the M1 follow-pins.

**Placement & Clock Tree Synthesis (CTS)**
* Optimized placement density to ~34.6%.
* Synthesized a zero-skew clock tree across 1,024 sequential sinks using the `ccopt` engine.

**Routing & Design For Manufacturing (DFM)**
* Utilized SI-aware NanoRoute engine for 100% global and detailed routing.
* Executed `route_design -via_opt` to upgrade single-cut vias to redundant multi-cut configurations.

**Signoff Static Timing Analysis (`scripts/sta_signoff.tcl`)**
* Performed rigorous multi-corner STA in Cadence Tempus using post-route SPEF parasitics and OCV/CPPR modeling.

## 🤝 Acknowledgments
This project was completed at the NUST Chip Design Centre (NCDC) under the supervision of Dr. Hammad Mehmood Cheema, with invaluable technical mentorship from Junaid, Fawad, and Hira.