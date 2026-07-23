`timescale 1ns/10ps

module alu_ctrl_tb;

    logic [1:0] alu_op;
    logic [2:0] funct3;
    logic       funct7_5;
    wire  [3:0] alu_ctrl;


    alu_ctrl dut (
        .alu_op(alu_op),
        .funct3(funct3),
        .funct7_5(funct7_5),
        .alu_ctrl(alu_ctrl)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_ctrl_tb);

        alu_op = 2'b00; funct3 = 3'b000; funct7_5 = 1'b0; 
      	#10;

        alu_op = 2'b01; funct3 = 3'b000; funct7_5 = 1'b0; 
      	#10;

        alu_op = 2'b10; funct3 = 3'b000; funct7_5 = 1'b0; 
      	#10;

        alu_op = 2'b10; funct3 = 3'b000; funct7_5 = 1'b1; 
      	#10;

        alu_op = 2'b10; funct3 = 3'b111; funct7_5 = 1'b0; 
      	#10;

        alu_op = 2'b10; funct3 = 3'b110; funct7_5 = 1'b0; 
      	#10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | ALUOp=%b | funct3=%b | funct7_5=%b => alu_ctrl=%b", 
                 $time, alu_op, funct3, funct7_5, alu_ctrl);
    end

endmodule
