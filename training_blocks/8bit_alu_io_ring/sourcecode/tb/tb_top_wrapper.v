`timescale 1ns/10ps

module top_wrapper_tb;

    // -------------------------------------------------------------------------
    // Signals
    // -------------------------------------------------------------------------
    reg  [7:0] A, B;
    reg  [1:0] Sel;
    reg        clk_in;
    reg        rst;
    wire [7:0] Out;

    // -------------------------------------------------------------------------
    // Instantiate the Design Under Test (DUT)
    // -------------------------------------------------------------------------
    top_wrapper uut (
        .A      (A),
        .B      (B),
        .Sel    (Sel),
        .clk_in (clk_in),
        .rst    (rst),
        .Out    (Out)
    );

    `ifdef SDF_TEST
        initial begin
            // Point the second argument to 'uut' (the instance name)
            $sdf_annotate("/home/cc/Fawad_PD/IO_PADS/export/Synthesis_Data/outputs/top_wrapper_synth.sdf", uut, "sdf.log", "MAXIMUM", "TOOL_CONTROL", "FROM_MTM");
        end
    `endif

    // -------------------------------------------------------------------------
    // Clock Generation (100 MHz)
    // -------------------------------------------------------------------------
    always #5 clk_in = ~clk_in;

    // -------------------------------------------------------------------------
    // Test Stimulus
    // -------------------------------------------------------------------------
    initial begin
        // Initialize signals
        clk_in = 0;
        rst    = 0;
        A      = 8'd0;
        B      = 8'd0;
        Sel    = 2'b00;

        // Apply Reset
        #20 rst = 1;

        // Test Case 1: AND operation (00)
        #10 A = 8'hAA; B = 8'h55; Sel = 2'b00; // AA (10101010) & 55 (01010101) = 00
        
        // Test Case 2: OR operation (01)
        #20 A = 8'h0F; B = 8'hF0; Sel = 2'b01; // 0F (00001111) | F0 (11110000) = FF
        
        // Test Case 3: NOT A (10)
        #20 A = 8'hA5; Sel = 2'b10;            // ~A5 (10100101) = 5A
        
        // Test Case 4: NOT B (11)
        #20 B = 8'h33; Sel = 2'b11;            // ~33 (00110011) = CC

        // End Simulation
        #20 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time=%0t | rst=%b | A=%h | B=%h | Sel=%b | Out=%h", 
                  $time, rst, A, B, Sel, Out);
    end

endmodule