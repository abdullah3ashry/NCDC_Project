`timescale 1ns/1ps  

module counter_dft_tb;
    reg clk;         
    reg reset;      
    wire [3:0] count;  

    // NEW: DFT Control Ports
    reg  scan_enable; // SE
    reg  scan_in;     // SI
    wire scan_out;    // SO

    // Variable to store the exact picosecond the clock edge occurs
    realtime clk_edge_time;

    // Instantiate UUT with DFT Ports
    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count),
        .SE(scan_enable),   // Connect Scan Enable
        .scan_in(scan_in),  // Connect Scan In
        .scan_out(scan_out) // Connect Scan Out
    );

`ifdef SDF_TEST
initial
    begin
        // Note: Ensure the path points to your latest synthesized SDF
        $sdf_annotate("/home/cc/Fawad_PD/example/export/Synthesis_Data/outputs/counter_physical_synth.sdf", counter_dft_tb.uut, "sdf.log", "MAXIMUM");
    end
`endif

    // 10ns Clock Period (100 MHz)
    always #5 clk = ~clk;  

    // PHYSICAL DELAY TRACKER
    always @(posedge clk) begin
        clk_edge_time = $realtime;
    end

    always @(count) begin
        // Only track delays when Scan is disabled and Reset is inactive
        if (reset == 0 && scan_enable == 0) begin 
            $display(">> [DELAY TRACKER] Time: %0t ns | Count arrived: %b | Path Delay: %0t ns", 
                     $realtime, count, ($realtime - clk_edge_time));
        end
    end

    // --- MAIN TEST SEQUENCE ---
    initial begin
        $timeformat(-9, 3, " ns", 10);
        
        // Initialize Signals
        clk = 0;
        reset = 1;
        scan_enable = 0;
        scan_in = 0;
        
        #15; 
        reset = 0; // Release Reset

        // ---------------------------------------------------------
        // PHASE 1: FUNCTIONAL MODE (Normal Counting)
        // ---------------------------------------------------------
        $display("\n--- STARTING FUNCTIONAL MODE ---");
        #100; // Let it count for 10 clock cycles

        // ---------------------------------------------------------
        // PHASE 2: SHIFT MODE (DFT Scan Chain Test)
        // ---------------------------------------------------------
        $display("\n--- STARTING DFT SHIFT MODE (SE=1) ---");
        @(posedge clk);
        scan_enable = 1; // Enable Scan Chain

        // Shift in a pattern: 1011
        // We provide data just before the clock edge
        scan_in = 1; @(posedge clk); #1; 
        scan_in = 1; @(posedge clk); #1; 
        scan_in = 0; @(posedge clk); #1; 
        scan_in = 1; @(posedge clk); #1; 

        // Turn off shift to "capture" or observe state
        scan_enable = 0;
        #20;

        $display("\n--- DFT TEST COMPLETE ---");
        $finish; 
    end
    
    // Monitor both functional count and scan output
    initial begin
        $monitor("Time: %0t ns | SE: %b | SI: %b | SO: %b | Count: %b", 
                 $realtime, scan_enable, scan_in, scan_out, count);
    end
endmodule