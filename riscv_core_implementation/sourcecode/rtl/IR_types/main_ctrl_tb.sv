`timescale 1ns/10ps

module main_ctrl_tb;

    logic [6:0] opcode;
    wire        mem_read;
    wire        mem_to_reg;
    wire  [1:0] alu_op;
    wire        mem_write;
    wire        alu_src;
    wire        reg_write;

    main_ctrl dut (
        .opcode(opcode),
        .mem_read(mem_read),
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_write(reg_write)
    );


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, main_ctrl_tb);

        // Test 1: R-Type
        opcode = 7'b0110011; #10;
        
        // Test 2: I-Type ALU (addi)
        opcode = 7'b0010011; #10;
        
        // Test 3: Load Word (lw)
        opcode = 7'b0000011; #10;
        
        // Test 4: Store Word (sw)
        opcode = 7'b0100011; #10;
        

        $finish;
    end


    initial begin
        $display("Time | Opcode | MR | MtR | ALUOp | MW | ALUSrc | RegW");
        $display("---------------------------------------------------------------");
        $monitor("%0t   | %b | %b  |  %b  |  %b   | %b  |   %b    |  %b", 
                 $time, opcode, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);
    end

endmodule
