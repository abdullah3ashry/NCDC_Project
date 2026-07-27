# RISC-V Datapath Implementation Progress

This document summarizes the development and integration of the RISC-V processor datapath, specifically focusing on the Register File, ALU, Control Units, and instruction simulation for R-Type and I-Type instructions.

## 1. Register File Correction
The register file was updated to resolve compilation errors and ensure proper synchronous behavior during reset.
- Fixed the missing `end` statement in the `always_ff` block.
- Updated blocking assignments (`=`) to non-blocking assignments (`<=`) inside the synchronous sequential block to correctly infer physical flip-flops.

## 2. ALU Implementation
The ALU was expanded to support all required R-Type and I-Type operations, including mathematical bounds, logical shifts, and logical operations.
- Added support for Shift Left Logical (SLL), Shift Right Logical (SRL), Shift Right Arithmetic (SRA), Set Less Than (SLT), and Set Less Than Unsigned (SLTU).
- Utilized the `$signed()` casting to ensure proper arithmetic shifting and signed comparisons.
- Added Flag Generation outputting Zero, Negative, Carry, and Overflow signals for branch condition evaluation.

## 3. ALU Control Decoder
The ALU control module was restructured to cleanly separate the decoding of R-Type and I-Type instructions. This prevents the "addi trap" where the negative immediate bit inadvertently triggers a subtraction if both instruction types share the same decode path.

## 4. Main Control Unit Updates
- Resolved syntax errors by removing default values for unused data memory signals.
- Fixed the `alu_op` for the I-Type opcode (`7'b0010011`) from `2'b00` to `2'b11`, correctly routing the instruction to the new I-Type decoder in the ALU control.
- Updated the main control to fully decode `jal`, `jalr`, loads, and stores, successfully asserting the `jump`, `mem_read`, and `mem_write` flags.
- Integrated B-Type branch decoding to assert the `branch` signal and force an ALU subtraction.
- Integrated U-Type decoding (`lui`, `auipc`) and added the `a_sel` multiplexer control line.

## 5. Instruction Memory & Verification
- Converted instruction memory files strictly to `.mem` extension for Vivado compatibility.
- Updated `i_mem` to initialize memory using `$readmemh("instructions.mem", memory);`.

## 6. Vivado Simulation Pipeline
Configured Vivado for complete RTL validation:
- Addressed hierarchical simulation locks (sim top vs. design top).
- Added crucial internal `dut` signals to the wave window to track datapath execution cycle-by-cycle (`pc_current`, `instruction`, `reg_write`, `alu_src`, `imm_extended`, `alu_ctrl_signal`, and `alu_result`).

## 7. Data Memory & Byte Masking Integration
- Upgraded `data_mem.sv` to accept a 4-bit `write_mask` instead of a 1-bit `mem_write` to allow isolated byte (`sb`) and half-word (`sh`) writes without destructive overwrites.
- Implemented a combinational `data_mem_ctrl.sv` controller to handle dynamic zero-extension (`lbu`, `lhu`) and sign-extension (`lb`, `lh`) for incoming memory payloads based on `funct3` and address LSBs.

## 8. Jump & Control Flow Implementation
- Updated `imm_gen.sv` to handle the physical `<< 1` hardware shift for J-Type jump targets internally by appending `1'b0` to the LSB during concatenation.
- Integrated jump routing multiplexers in `riscv_top.sv` to intercept the `jalr` opcode (selecting the ALU result directly) and defaulting to `pc_current + imm_extended` for `jal` instructions.
- Connected the `write_data_rf` multiplexer to save `PC + 4` as the return address during jump executions.

## 9. Branch Evaluation Unit 
- Implemented a dedicated `branch_comp.sv` module to evaluate conditional branching (e.g., `beq`, `bne`, `blt`).
- Routed ALU flags (Zero, Negative, Carry, Overflow) directly into the branch comparator to safely resolve signed and unsigned inequalities without datapath collisions.

## 10. Full Load-Store-Jump Verification
- Validated the complete datapath in Vivado using a comprehensive assembly sequence.
- Successfully proved arithmetic stability alongside complex masked memory updates (`sw`, `sb`), memory extensions (`lw`, `lb`, `lbu`), and precise control flow branching (`jal`, `jalr`).