`timescale 1ns/10ps

module main_ctrl_tb;

    // 1. Declare Testbench Signals
    logic [6:0] opcode;
    logic       reg_write;
    logic       alu_src;
    logic       mem_read;
    logic       mem_write;
    logic       mem_to_reg;
    logic       jump;
    logic [1:0] alu_op;

    // 2. Instantiate the Main Control Unit (Device Under Test)
    main_ctrl dut (
        .opcode(opcode),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .jump(jump),
        .alu_op(alu_op)
    );

    // 3. Test Sequence
    initial begin
        $display("==========================================================================");
        $display("                     Main Control Unit Testbench                          ");
        $display("==========================================================================");
        $display("Opcode  | RegW | ALUSrc | MemR | MemW | Mem2Reg | Jump | ALUOp | Result ");
        $display("--------|------|--------|------|------|---------|------|-------|--------");

        // Test 1: R-Type (add, sub, etc.)
        // Expected: RegW=1, ALUSrc=0, MemR=0, MemW=0, Mem2Reg=0, Jump=0, ALUOp=10
        opcode = 7'b0110011;
        #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op);
        if ({reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op} === 8'b10000010)
             $display("PASS (R-Type)");
        else $display("FAIL");

        // Test 2: I-Type ALU (addi, etc.)
        // Expected: RegW=1, ALUSrc=1, MemR=0, MemW=0, Mem2Reg=0, Jump=0, ALUOp=11
        opcode = 7'b0010011;
        #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op);
        if ({reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op} === 8'b11000011)
             $display("PASS (I-Type ALU)");
        else $display("FAIL");

        // Test 3: I-Type Load (lw)
        // Expected: RegW=1, ALUSrc=1, MemR=1, MemW=0, Mem2Reg=1, Jump=0, ALUOp=00
        opcode = 7'b0000011;
        #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op);
        if ({reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op} === 8'b11101000)
             $display("PASS (Load)");
        else $display("FAIL");

        // Test 4: S-Type Store (sw)
        // Expected: RegW=0, ALUSrc=1, MemR=0, MemW=1, Mem2Reg=0, Jump=0, ALUOp=00
        opcode = 7'b0100011;
        #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op);
        if ({reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op} === 8'b01010000)
             $display("PASS (Store)");
        else $display("FAIL");

        // Test 5: J-Type Jump and Link (jal)
        // Expected: RegW=1, ALUSrc=X, MemR=0, MemW=0, Mem2Reg=0, Jump=1, ALUOp=00
        opcode = 7'b1101111;
        #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op);
        if ({reg_write, mem_read, mem_write, mem_to_reg, jump} === 5'b10001) 
             $display("PASS (Jal)");
        else $display("FAIL");

        // Test 6: I-Type Jump and Link Register (jalr)
        // Expected: RegW=1, ALUSrc=1, MemR=0, MemW=0, Mem2Reg=0, Jump=1, ALUOp=00
        opcode = 7'b1100111;
        #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op);
        if ({reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op} === 8'b11000100)
             $display("PASS (Jalr)");
        else $display("FAIL");

        // Test 7: Default (Invalid Opcode)
        // Expected: All 0s
        opcode = 7'b1111111;
        #10;
        $write("%b |   %b  |   %b    |  %b   |  %b   |    %b    |  %b   |  %b   | ", 
               opcode, reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op);
        if ({reg_write, alu_src, mem_read, mem_write, mem_to_reg, jump, alu_op} === 8'b00000000)
             $display("PASS (Default/Safe)");
        else $display("FAIL");

        $display("==========================================================================");
        $finish;
    end

endmodule