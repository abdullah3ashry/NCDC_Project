# RISC-V Single-Cycle Processor (Base Integer Instruction Set)

## Overview
This repository contains a SystemVerilog implementation of a single-cycle RISC-V processor. Currently, the datapath is designed to fetch, decode, and execute the core **R-Type** and **I-Type** arithmetic and logical instructions. The architecture has recently been fully expanded to support **S-Type** stores, load operations, and **J-Type** control flow instructions. Additionally, the processor supports **B-Type** conditional branches and **U-Type** upper immediate instructions. The design has been fully simulated and verified using Xilinx Vivado.

## Features Implemented So Far

### 1. Arithmetic Logic Unit (ALU)
A fully combinational 32-bit ALU supporting the following operations:
*   **Arithmetic:** Addition (`ADD`), Subtraction (`SUB`)
*   **Logical:** `AND`, `OR`, `XOR`
*   **Shifts:** Shift Left Logical (`SLL`), Shift Right Logical (`SRL`), Shift Right Arithmetic (`SRA`)
*   **Comparisons:** Set Less Than (`SLT`), Set Less Than Unsigned (`SLTU`)
*   **Status Flags:** Computes Zero, Negative, Carry, and Overflow states continuously.

### 2. Register File
*   32x32-bit standard RISC-V register architecture.
*   Hardwired `x0` (zero register).
*   Synchronous write operations with active-high `RegWEn`.
*   Fully synchronous reset for FPGA hardware safety and predictable simulation states.

### 3. Control Logic & Branching
*   **Main Control:** Decodes the 7-bit opcode to drive multiplexers (like `alu_src`) and enable write signals.
*   **ALU Control:** Utilizes a dedicated two-level decoding scheme. It safely separates I-Type and R-Type instructions to prevent conflicts with the immediate values (resolving the common `addi` vs. `sub` hardware trap).
*   **Branch Comparator:** A dedicated hardware unit that processes ALU flags and `funct3` bits to accurately resolve B-Type execution paths.

### 4. Instruction Fetch & Immediate Generation
*   Instruction memory initialized via standard `.mem` hex files.
*   Successfully handles immediate extraction and sign-extension for 12-bit I-Type and S-Type immediates.
*   Performs implicit logical left-shifts for J-Type targets by appending a binary `0`.
*   Extracts 20-bit U-Type payloads alongside scrambled B-Type immediate parsing.

### 5. Memory Subsystem
*   **Data Memory:** 32-bit memory array equipped with a 4-bit byte-enable mask to securely execute partial-word writes (bytes and halfwords) without destroying adjacent data.
*   **Data Controller:** A combinational logic wrapper that handles dynamic sign-extension and zero-extension for loads based on alignment and instruction type.

### 6. Control Flow & Jumps
*   Top-level datapath handles branch and jump target calculation.
*   Multiplexing logic cleanly separates PC relative jumps (`jal`) from register relative jumps (`jalr`) while safely storing the return address in the register file.

## Verified Instruction Set
The current datapath has been simulated against the following instructions:
*   **R-Type:** `add`, `sub`, `and`, `or`, `xor`, `sll`, `srl`, `sra`, `slt`, `sltu`
*   **I-Type (ALU):** `addi`, `andi`, `ori`, `xori`, `slli`, `srli`, `srai`, `slti`, `sltiu`
*   **I-Type (Loads):** `lw`, `lh`, `lhu`, `lb`, `lbu`
*   **S-Type (Stores):** `sw`, `sh`, `sb`
*   **J-Type (Jumps):** `jal`, `jalr`
*   **B-Type (Branches):** `beq`, `bne`, `blt`, `bge`, `bltu`, `bgeu`
*   **U-Type (Immediates):** `lui`, `auipc`

## Tools & Environment
*   **Language:** SystemVerilog
*   **Simulation & Synthesis:** Xilinx Vivado (XSim)

## How to Simulate
1. Open the project in Vivado.
2. Ensure the `instructions.mem` file is loaded into the project sources.
3. Set `riscv_top_tb.sv` as the top simulation module.
4. Run Behavioral Simulation.
5. Add the internal `dut` signals to the waveform viewer to trace `pc_current`, `instruction`, and `alu_result` across clock cycles.

---
*Author: Abdullah*