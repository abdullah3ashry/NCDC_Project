`timescale 1ns/10ps

module main_ctrl_tb;

    logic [6:0] opcode;
    logic       reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel;
    logic [1:0] alu_op;

    main_ctrl dut (
        .opcode(opcode),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .jump(jump),
        .branch(branch),
        .a_sel(a_sel),
        .alu_op(alu_op)
    );

    initial begin
        $display("=========================================================================================");
        $display("                         Main Control Unit Testbench (Updated)                           ");
        $display("=========================================================================================");
        $display("Opcode  | RegW | ALUSrc | MemR | MemW | Mem2Reg | Jump | Branch | ASel | ALUOp | Result");
        $display("--------|------|--------|------|------|---------|------|--------|------|-------|-------");

        // R-Type
        opcode = 7'b0110011; #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |   %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel, alu_op);
        if ({reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel, alu_op} === 10'b1000000010) $display("PASS (R-Type)"); else $display("FAIL");

        // S-Type Store
        opcode = 7'b0100011; #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |   %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel, alu_op);
        if ({reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel, alu_op} === 10'b0101000000) $display("PASS (Store)"); else $display("FAIL");

        // J-Type Jal
        opcode = 7'b1101111; #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |   %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel, alu_op);
        if ({reg_write, jump, branch, a_sel} === 4'b1100) $display("PASS (Jal)"); else $display("FAIL");

        // B-Type Branch (NEW)
        opcode = 7'b1100011; #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |   %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel, alu_op);
        if ({reg_write, jump, branch, a_sel} === 4'b0010) $display("PASS (Branch)"); else $display("FAIL");

        // U-Type LUI (NEW)
        opcode = 7'b0110111; #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |   %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel, alu_op);
        if ({reg_write, alu_src, branch, a_sel, alu_op} === 6'b110000) $display("PASS (LUI)"); else $display("FAIL");

        // U-Type AUIPC (NEW)
        opcode = 7'b0010111; #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |   %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, branch, a_sel, alu_op);
        if ({reg_write, alu_src, branch, a_sel, alu_op} === 6'b110100) $display("PASS (AUIPC)"); else $display("FAIL");

        $display("=========================================================================================");
        $finish;
    end
endmodule