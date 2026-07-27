`timescale 1ns/10ps

module data_mem_tb;

    // 1. Declare Testbench Signals
    logic        clk;
    logic        mem_read;
    logic        mem_write;
    logic [3:0]  write_mask; // NEW: Added write mask signal
    logic [31:0] addr;
    logic [31:0] write_data;
    logic [31:0] read_data;

    // 2. Instantiate the Data Memory (Device Under Test)
    data_mem dut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .write_mask(write_mask), // NEW: Connected to DUT
        .addr(addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    // 3. Clock Generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    // 4. Test Sequence
    initial begin
        clk        = 0;
        mem_read   = 0;
        mem_write  = 0;
        write_mask = 4'b0000; // NEW: Initialize mask
        addr       = 32'b0;
        write_data = 32'b0;

        $display("--- Starting Data Memory Testbench ---");
        #15; 

        // Test 1: Standard Aligned Write & Read (Address 4)
        mem_write  = 1'b1;
        write_mask = 4'b1111; // Enable all 4 bytes
        addr       = 32'd4;
        write_data = 32'hAAAA_BBBB;
        #10; 
        
        mem_write  = 1'b0;
        mem_read   = 1'b1;
        #5; 
        if (read_data !== 32'hAAAA_BBBB) $display("FAIL: Standard Read at Addr 4. Got %h", read_data);
        else $display("PASS: Standard Read at Addr 4");
        #5;

        // Test 2: Unaligned Address Mapping (Address 6 should map to 4)
        addr       = 32'd6; 
        #5;
        if (read_data !== 32'hAAAA_BBBB) $display("FAIL: Unaligned Read at Addr 6. Got %h", read_data);
        else $display("PASS: Unaligned Read at Addr 6 (Mapped to 4 successfully)");
        #5;

        // Test 3: Write Disable Protection
        mem_write  = 1'b0; 
        mem_read   = 1'b0;
        write_mask = 4'b1111; // Mask is full, but mem_write is 0
        addr       = 32'd8;
        write_data = 32'hFFFF_FFFF;
        #10; 
        
        mem_read   = 1'b1; 
        #5;
        // Should NOT be FFFFFFFF because mem_write was 0
        if (read_data === 32'hFFFF_FFFF) $display("FAIL: Write Disable Protection Failed!");
        else $display("PASS: Write Disable Protection Active.");
        #5;

        // Test 4: Upper Boundary Test (Address 4092)
        mem_write  = 1'b1;
        mem_read   = 1'b0;
        write_mask = 4'b1111;
        addr       = 32'd4092; 
        write_data = 32'h9999_9999;
        #10;
        
        mem_write  = 1'b0;
        mem_read   = 1'b1;
        #5;
        if (read_data !== 32'h9999_9999) $display("FAIL: Upper Boundary Read at Addr 4092. Got %h", read_data);
        else $display("PASS: Upper Boundary Read at Addr 4092");
        #5;
        
        // =========================================================
        // NEW TESTS: MASKING LOGIC
        // =========================================================
        
        // Test 5: Half-Word Masking (Write to Address 12)
        // First, write a full word so we have a baseline
        mem_write  = 1'b1;
        mem_read   = 1'b0;
        write_mask = 4'b1111;
        addr       = 32'd12;
        write_data = 32'h1111_2222;
        #10;
        
        // Now, overwrite ONLY the bottom half with FFFF
        write_mask = 4'b0011; // Only enable bytes 0 and 1
        write_data = 32'hFFFF_FFFF; // Try to write FFFF everywhere
        #10;
        
        mem_write  = 1'b0;
        mem_read   = 1'b1;
        #5;
        // The top half should remain 1111, bottom half becomes FFFF
        if (read_data !== 32'h1111_FFFF) $display("FAIL: Half-Word Masking. Got %h", read_data);
        else $display("PASS: Half-Word Masking (Preserved top half)");
        #5;

        // Test 6: Single Byte Masking (Write to Address 16)
        // Baseline write
        mem_write  = 1'b1;
        mem_read   = 1'b0;
        write_mask = 4'b1111;
        addr       = 32'd16;
        write_data = 32'h0000_0000;
        #10;
        
        // Overwrite ONLY Byte 2 (bits 23:16) with EE
        write_mask = 4'b0100; 
        write_data = 32'hEEEE_EEEE;
        #10;
        
        mem_write  = 1'b0;
        mem_read   = 1'b1;
        #5;
        // Only Byte 2 should change
        if (read_data !== 32'h00EE_0000) $display("FAIL: Single Byte Masking. Got %h", read_data);
        else $display("PASS: Single Byte Masking (Isolated byte write)");
        #5;

        // Test 7: mem_read Disable Behavior
        mem_read   = 1'b0;
        #5;
        if (read_data !== 32'b0) $display("FAIL: mem_read Disable. Output should be 0, got %h", read_data);
        else $display("PASS: mem_read Disable outputs 0");

        #10;
        $display("--- Testbench Complete ---");
        $finish;
    end

endmodule