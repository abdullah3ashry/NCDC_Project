# Lab 01 Progress: 4-Bit Counter Physical Design
**Date Saved:** August 7, 2026
**Workspace:** `/home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/workspace`

## 1. Current Status
*   **Innovus Session:** Safely closed.
*   **Database Saved:** `counter_routed.db`
*   **Exported Handoff Files:**
    *   GDSII Layout: `outputs/pnr/counter.gds`
    *   Final Netlist: `outputs/pnr/counter.final.v`
    *   Parasitics: `outputs/pnr/counter.spef`
    *   Power Report: `reports/verify/power_report.rpt`

---

## 2. Completed Milestones
- [x] **Task 1: Implementation & Layout Generation**
  - [x] Floorplanning & Power Network Synthesis (Rings/Stripes)
  - [x] Placement & Pre-CTS Optimization
  - [x] Clock Tree Synthesis (0.000 ns skew achieved)
  - [x] Routing & Post-Route Optimization
  - [x] DFM (Multi-cut Vias, Wire Spreading) & Fillers
- [x] **Task 2: Physical & Electrical Verification**
  - [x] Innovus DRC (0 Violations)
  - [x] Innovus Connectivity (0 Violations)
  - [x] Power Analysis (Total Power: 11.56 µW)

---

## 3. Tomorrow's Goals (Pending Tasks)
### Task 3: Backend Formal Verification (Cadence Conformal)
*Execute standalone `lec` command in the standard Linux terminal.*
- [ ] **Run 1: Post-Placement** (`counter_placed.v`)
  - Capture GUI screenshot of Primitives Table & Compared Points.
- [ ] **Run 2: Post-CTS** (`counter_cts.v`)
  - Capture GUI screenshot of Primitives Table & Compared Points.
  - *Report Note:* Explain the primitive count increase (8 to 12) due to `CKBD4` clock buffer insertion by the `ccopt_design` engine.
- [ ] **Run 3: Post-Route** (`counter_routed.v`)
  - Verify terminal output shows "PASS" and "Equivalent".

### Task 4a: Physical Verification LVS Signoff (Cadence Pegasus)
*Execute standalone PVS/Pegasus engine in the standard Linux terminal.*
- [ ] Run Pegasus using `pegasus_ctrl.ctl` to compare `counter.gds` against the routed netlist.
- [ ] Verify `lvs.rep` shows exactly 0 incorrect nets and 0 incorrect instances ("Matches").
- [ ] Verify `erc.sum` and `lvs.rep.shorts` are clean.

### Task 4b: Signoff STA (Cadence Tempus)
*Execute standalone Tempus engine in the standard Linux terminal.*
- [ ] Launch Tempus and run the STA script using the exported `.v` and `.spef` files.
- [ ] Extract the final Setup WNS/TNS and Hold WNS/TNS for the Technical Analysis Report.

---

## 4. How to Resume
1. Log into your Linux machine.
2. Open a standard terminal.
3. Initialize the Cadence tools:
```bash
   csh
   source cshrc
```
