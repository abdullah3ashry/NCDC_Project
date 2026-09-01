# RISC-V Datapath Implementation Progress

This document summarizes the development and integration of the RISC-V processor datapath, specifically focusing on the Register File, ALU, Control Units, and instruction simulation for R-Type and I-Type instructions.

## 1. Register File Correction
The register file was updated to resolve compilation errors and ensure proper synchronous behavior during reset.
- Fixed the missing `end` statement in the `always_ff` block.
- Updated blocking assignments (`=`) to non-blocking assignments (`<=`) inside the synchronous sequential block to correctly infer physical flip-flops.

```systemverilog
module reg_file (
    input  logic        clk,
    input  logic        RegWEn,
    input  logic        rst,
    input  logic [4:0]  rs1,
    input  logic [4:0]  rs2,
    input  logic [4:0]  rsW,
    input  logic [31:0] dataW,
    output logic [31:0] data1,
    output logic [31:0] data2
);

    logic [31:0] registers [31:0];

    assign data1 = (rs1 == 5'b00000) ? 32'b0 : registers[rs1];
    assign data2 = (rs2 == 5'b00000) ? 32'b0 : registers[rs2];

    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < 32; i++) begin
                registers[i] <= 32'b0; 
            end
        end 
        else if (RegWEn) begin
            if (rsW != 5'b00000) begin
                registers[rsW] <= dataW;
            end
        end
    end
endmodule
```

## 2. ALU Implementation
The ALU was expanded to support all required R-Type and I-Type operations, including mathematical bounds, logical shifts, and logical operations.
- Added support for Shift Left Logical (SLL), Shift Right Logical (SRL), Shift Right Arithmetic (SRA), Set Less Than (SLT), and Set Less Than Unsigned (SLTU).
- Utilized the `$signed()` casting to ensure proper arithmetic shifting and signed comparisons.

```systemverilog
`timescale 1ns/10ps
module alu (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic [3:0]  alu_ctrl,
    output logic [31:0] alu_result,
    output logic        zero
);

    always_comb begin
        case (alu_ctrl)
            4'b0000: alu_result = a & b;                                     // AND
            4'b0001: alu_result = a | b;                                     // OR
            4'b0010: alu_result = a + b;                                     // ADD
            4'b0011: alu_result = a ^ b;                                     // XOR
            4'b0100: alu_result = a << b[4:0];                               // SLL
            4'b0101: alu_result = a >> b[4:0];                               // SRL
            4'b0110: alu_result = a - b;                                     // SUB
            4'b0111: alu_result = $signed(a) >>> b[4:0];                     // SRA
            4'b1000: alu_result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0; // SLT
            4'b1001: alu_result = (a < b) ? 32'd1 : 32'd0;                   // SLTU
            default: alu_result = 32'b0;
        endcase
    end

    assign zero = (alu_result == 32'b0) ? 1'b1 : 1'b0;
endmodule
```

## 3. ALU Control Decoder
The ALU control module was restructured to cleanly separate the decoding of R-Type and I-Type instructions. This prevents the "addi trap" where the negative immediate bit inadvertently triggers a subtraction if both instruction types share the same decode path.

```systemverilog
`timescale 1ns/10ps
module alu_ctrl(
    input  logic [1:0] alu_op,
    input  logic [2:0] funct3,
    input  logic       funct7_5,
    output logic [3:0] alu_ctrl
);
  
  always_comb begin
    case(alu_op)
      // R-Type Instructions
      2'b10: begin 
        case(funct3)
          3'b000: alu_ctrl = (funct7_5 == 1'b1) ? 4'b0110 : 4'b0010; // SUB : ADD
          3'b001: alu_ctrl = 4'b0100; // SLL
          3'b010: alu_ctrl = 4'b1000; // SLT
          3'b011: alu_ctrl = 4'b1001; // SLTU
          3'b100: alu_ctrl = 4'b0011; // XOR
          3'b101: alu_ctrl = (funct7_5 == 1'b1) ? 4'b0111 : 4'b0101; // SRA : SRL
          3'b110: alu_ctrl = 4'b0001; // OR
          3'b111: alu_ctrl = 4'b0000; // AND
        endcase
      end
      
      // I-Type ALU Instructions 
      2'b11: begin 
        case(funct3)
          3'b000: alu_ctrl = 4'b0010; // ADDI (Always ADD, ignore funct7_5)
          3'b001: alu_ctrl = 4'b0100; // SLLI
          3'b010: alu_ctrl = 4'b1000; // SLTI
          3'b011: alu_ctrl = 4'b1001; // SLTIU
          3'b100: alu_ctrl = 4'b0011; // XORI
          3'b101: alu_ctrl = (funct7_5 == 1'b1) ? 4'b0111 : 4'b0101; // SRAI : SRLI
          3'b110: alu_ctrl = 4'b0001; // ORI
          3'b111: alu_ctrl = 4'b0000; // ANDI
        endcase
      end
      
      default: alu_ctrl = 4'b0000;
    endcase
  end
endmodule
```

## 4. Main Control Unit Updates
- Resolved syntax errors by removing default values for unused data memory signals.
- Fixed the `alu_op` for the I-Type opcode (`7'b0010011`) from `2'b00` to `2'b11`, correctly routing the instruction to the new I-Type decoder in the ALU control.

## 5. Instruction Memory & Verification
- Converted instruction memory files strictly to `.mem` extension for Vivado compatibility.
- Updated `i_mem` to initialize memory using `$readmemh("instructions.mem", memory);`.

### Test Program (10-Instruction R/I-Type Validation)
The following sequence verifies standard arithmetic, negative immediates, and logical operations.

**Hexadecimal (`instructions.mem`)**
```text
00500093
00a00113
002081b3
40110233
fff00293
0050f333
0020e3b3
01420413
001404b3
40248533
```

**Assembly Equivalent**
*   `addi x1, x0, 5`
*   `addi x2, x0, 10`
*   `add x3, x1, x2`
*   `sub x4, x2, x1`
*   `addi x5, x0, -1`
*   `and x6, x1, x5`
*   `or x7, x1, x2`
*   `addi x8, x4, 20`
*   `add x9, x8, x1`
*   `sub x10, x9, x2`

## 6. Vivado Simulation Pipeline
Configured Vivado for complete RTL validation:
- Addressed hierarchical simulation locks (sim top vs. design top).
- Added crucial internal `dut` signals to the wave window to track datapath execution cycle-by-cycle (`pc_current`, `instruction`, `reg_write`, `alu_src`, `imm_extended`, `alu_ctrl_signal`, and `alu_result`).
