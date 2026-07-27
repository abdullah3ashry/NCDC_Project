`timescale 1ns/10ps

module alu_tb;

    logic [31:0] a;
    logic [31:0] b;
    logic [3:0]  alu_ctrl;
    logic [31:0] alu_result;
    logic        zero;


    alu dut (
        .a(a),
        .b(b),
        .alu_ctrl(alu_ctrl),
        .alu_result(alu_result),
        .zero(zero)
    );


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_tb);


        a = 32'd15;
        b = 32'd10;


        alu_ctrl = 4'b0010;
        #10;


        alu_ctrl = 4'b0110;
        #10;


        alu_ctrl = 4'b0000;
        #10;


        alu_ctrl = 4'b0001;
        #10;


        a = 32'd15;
        b = 32'd15;
        alu_ctrl = 4'b0110;
        #10;

        $finish;
    end


    initial begin
        $monitor("Time = %0t | a = %0d | b = %0d | ctrl = %b | result = %0d | zero = %b", 
                 $time, a, b, alu_ctrl, alu_result, zero);
    end

endmodule
