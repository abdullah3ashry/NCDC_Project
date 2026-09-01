`timescale 1ns/1ps  

module counter_tb;
reg clk;         
    reg reset;      
    wire [3:0] count;  

    // NEW: Variable to store the exact picosecond the clock edge occurs
    realtime clk_edge_time;

    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

`ifdef SDF_TEST
initial
    begin
        $sdf_annotate("/home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Synthesis_Data/outputs/counter_physical_synth.sdf", counter_tb.uut);
	$dumpfile("waves.vcd"); 
        $dumpvars(0, counter_tb);
    end
`endif

    // 10ns Clock Period (100 MHz)
    always #5 clk = ~clk;  

    // -------------------------------------------------------------------------
    // PHYSICAL DELAY TRACKER
    // -------------------------------------------------------------------------
    // 1. Snapshot the time whenever the clock rises
    always @(posedge clk) begin
        clk_edge_time = $realtime;
    end

    // 2. Whenever the output count changes, calculate how long it took 
    // to travel through the TSMC gates and physical wires!
    always @(count) begin
        if (reset == 0) begin // Only track delays during normal counting
            $display(">> [DELAY TRACKER] Time: %0t ns | Count arrived: %b | Path Delay: %0t ns", 
                     $realtime, count, ($realtime - clk_edge_time));
        end
    end
    // -------------------------------------------------------------------------

    initial begin
        $timeformat(-9, 3, " ns", 10);
        clk = 0;
        reset = 1;
        
        #10; 
        reset = 0;
        
        // Extended from 100 to 200 to see more physical transitions
        #200 $finish; 
    end
    
    initial begin
        // Upgraded from $time to $realtime to see sub-nanosecond precision
        $monitor("Time: %0t ns | clk = %b | reset = %b | count = %b", $realtime, clk, reset, count);
    end
endmodule
