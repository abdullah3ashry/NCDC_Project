`timescale 1ns/10ps

module riscv_top (
    input  logic        rst,
    input  logic        clk,
    output logic [31:0] pc_current,
    output logic [31:0] alu_result,
    output logic [31:0] formatted_dmem_write,
    output logic [3:0]  dmem_write_mask,
    output logic        mem_read,
    output logic        mem_write,
    output logic [31:0] raw_dmem_read
);

    logic [31:0] instruction;

    // 1. Instantiate the RISC-V Core
    riscv_core riscv_core_inst (
        .rst(rst),
        .clk(clk),
        .pc_current(pc_current),
        .instruction(instruction),
        .alu_result(alu_result),
        .formatted_dmem_write(formatted_dmem_write),
        .dmem_write_mask(dmem_write_mask),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .raw_dmem_read(raw_dmem_read)
    );

    // 2. Instantiate Instruction Memory
    i_mem i_mem_inst (
        .addr(pc_current),
        .word(instruction)
    );

    // 3. Instantiate Data Memory
    data_mem data_mem_inst (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .write_mask(dmem_write_mask),
        .addr(alu_result),
        .write_data(formatted_dmem_write),
        .read_data(raw_dmem_read)
    );

endmodule
