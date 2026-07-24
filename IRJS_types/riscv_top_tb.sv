`timescale 1ns/10ps

module riscv_top_tb;

    // 1. Declare Testbench Signals
    logic clk;
    logic rst;

    // 2. Instantiate the Top-Level Processor (Device Under Test)
    riscv_top dut (
        .clk(clk),
        .rst(rst)
    );

    // 3. Clock Generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    // 4. Test Sequence
    initial begin
        $display("=================================================");
        $display("          Starting RISC-V Processor              ");
        $display("=================================================");
        
        // Initialize clock and assert reset
        clk = 0;
        rst = 1; 

        // Hold reset high for a few clock cycles to ensure 
        // the Program Counter (PC) and registers initialize to 0.
        #20;
        
        // De-assert reset to let the processor start fetching and executing
        rst = 0; 

        // Let the processor run for a set amount of time.
        // Adjust this duration based on how many instructions are in your i_mem.
        // (100ns = 10 instructions at 10ns per cycle)
        #200; 

        $display("=================================================");
        $display("          Simulation Complete                    ");
        $display("=================================================");
        $finish;
    end

endmodule