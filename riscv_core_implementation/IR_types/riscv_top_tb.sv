`timescale 1ns/10ps

module riscv_top_tb;


    logic rst;
    logic clk;


    riscv_top dut (
        .rst(rst),
        .clk(clk)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin
        //$dumpfile("dump.vcd");
        //$dumpvars(0, riscv_top_tb);


        rst = 1'b1;
        #15; 
        

        rst = 1'b0;


        #100;

        $stop;
    end

    // 5. Console Monitoring
    initial begin
        $display("-------------------------------------------------------------------------");
        $display("Time  | Rst | PC   | Instruction | ALU_Out | RegWEn");
        $display("-------------------------------------------------------------------------");
        
        $monitor("%0t    |  %b  | %0d    |  %h   |   %0d     |   %b", 
                 $time, rst, dut.pc_current, dut.instruction, dut.alu_result, dut.reg_write);
    end

endmodule
