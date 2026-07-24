`timescale 1ns/10ps

module data_mem_ctrl_tb;

    // 1. Declare Testbench Signals
    logic [2:0]  funct3;
    logic [1:0]  addr_lsb;
    logic [31:0] read_data_in;
    logic [31:0] write_data_in;
    
    logic [31:0] read_data_out;
    logic [31:0] write_data_out;
    logic [3:0]  write_mask;

    // 2. Instantiate the Device Under Test (DUT)
    data_mem_ctrl dut (
        .funct3(funct3),
        .addr_lsb(addr_lsb),
        .read_data_in(read_data_in),
        .write_data_in(write_data_in),
        .read_data_out(read_data_out),
        .write_data_out(write_data_out),
        .write_mask(write_mask)
    );

    // 3. Test Sequence
    initial begin
        $display("=========================================================================================");
        $display("                             Data Memory Controller Testbench                            ");
        $display("=========================================================================================");
        
        // ---------------------------------------------------------
        // PART 1: TESTING LOADS (READ FORMATTING)
        // ---------------------------------------------------------
        $display("\n--- TESTING LOADS (read_data_in = 32'hDEADBEEF) ---");
        // DEADBEEF breakdown: Byte 3=DE, Byte 2=AD, Byte 1=BE, Byte 0=EF
        read_data_in  = 32'hDEADBEEF; 
        write_data_in = 32'h00000000; // Not used during loads

        // Test 1: lw (Load Word) - Should pass through unaltered
        funct3 = 3'b010; addr_lsb = 2'b00; #10;
        $display("lw  (Word)         | Expected: deadbeef | Actual: %h", read_data_out);

        // Test 2: lb (Load Byte Sign-Extended) - Byte 0 is EF (negative)
        funct3 = 3'b000; addr_lsb = 2'b00; #10;
        $display("lb  (Byte 0 Sign)  | Expected: ffffffef | Actual: %h", read_data_out);

        // Test 3: lbu (Load Byte Zero-Extended) - Byte 1 is BE
        funct3 = 3'b100; addr_lsb = 2'b01; #10;
        $display("lbu (Byte 1 Zero)  | Expected: 000000be | Actual: %h", read_data_out);

        // Test 4: lh (Load Halfword Sign-Extended) - Half 1 is DEAD (negative)
        funct3 = 3'b001; addr_lsb = 2'b10; #10;
        $display("lh  (Half 1 Sign)  | Expected: ffffdead | Actual: %h", read_data_out);

        // Test 5: lhu (Load Halfword Zero-Extended) - Half 0 is BEEF
        funct3 = 3'b101; addr_lsb = 2'b00; #10;
        $display("lhu (Half 0 Zero)  | Expected: 0000beef | Actual: %h", read_data_out);


        // ---------------------------------------------------------
        // PART 2: TESTING STORES (WRITE FORMATTING & MASKS)
        // ---------------------------------------------------------
        $display("\n--- TESTING STORES (write_data_in = 32'h12345678) ---");
        read_data_in  = 32'h00000000; // Not used during stores
        write_data_in = 32'h12345678; // We want to store the 78 (byte) or 5678 (half)

        // Test 6: sw (Store Word)
        funct3 = 3'b010; addr_lsb = 2'b00; #10;
        $display("sw (Store Word)    | Addr: 00 | Mask: %b | Data Out: %h", write_mask, write_data_out);

        // Test 7: sh (Store Halfword) at bottom half
        funct3 = 3'b001; addr_lsb = 2'b00; #10;
        $display("sh (Store Half 0)  | Addr: 00 | Mask: %b | Data Out: %h", write_mask, write_data_out);

        // Test 8: sh (Store Halfword) at top half
        funct3 = 3'b001; addr_lsb = 2'b10; #10;
        $display("sh (Store Half 1)  | Addr: 10 | Mask: %b | Data Out: %h", write_mask, write_data_out);

        // Test 9: sb (Store Byte) at Byte 2
        funct3 = 3'b000; addr_lsb = 2'b10; #10;
        $display("sb (Store Byte 2)  | Addr: 10 | Mask: %b | Data Out: %h", write_mask, write_data_out);
        
        // Test 10: sb (Store Byte) at Byte 3
        funct3 = 3'b000; addr_lsb = 2'b11; #10;
        $display("sb (Store Byte 3)  | Addr: 11 | Mask: %b | Data Out: %h", write_mask, write_data_out);

        $display("=========================================================================================");
        $finish;
    end

endmodule