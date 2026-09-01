`timescale 1ns/10ps

module branch_comp_tb;

    // 1. Declare Testbench Signals
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;
    logic [2:0]  funct3;
    logic        branch_taken;

    // 2. Instantiate the DUT
    branch_comp dut (
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .funct3(funct3),
        .branch_taken(branch_taken)
    );

    // 3. Test Sequence
    initial begin
        $display("=================================================");
        $display("           Branch Comparator Testbench           ");
        $display("=================================================");
        
        // Test 1: BEQ (Branch if Equal)
        funct3 = 3'b000; rs1_data = 32'd50; rs2_data = 32'd50; #10;
        if (branch_taken !== 1'b1) $display("FAIL: BEQ (Equal)"); else $display("PASS: BEQ (Equal)");
        
        rs1_data = 32'd50; rs2_data = 32'd40; #10;
        if (branch_taken !== 1'b0) $display("FAIL: BEQ (Not Equal)"); else $display("PASS: BEQ (Not Equal)");

        // Test 2: BNE (Branch if Not Equal)
        funct3 = 3'b001; rs1_data = 32'd50; rs2_data = 32'd40; #10;
        if (branch_taken !== 1'b1) $display("FAIL: BNE (Not Equal)"); else $display("PASS: BNE (Not Equal)");

        // Test 3: BLT (Branch Less Than - Signed)
        // -1 (0xFFFFFFFF) is less than 1 (0x00000001) in signed arithmetic
        funct3 = 3'b100; rs1_data = 32'hFFFFFFFF; rs2_data = 32'h00000001; #10;
        if (branch_taken !== 1'b1) $display("FAIL: BLT (Signed -1 < 1)"); else $display("PASS: BLT (Signed -1 < 1)");

        // Test 4: BGE (Branch Greater/Equal - Signed)
        funct3 = 3'b101; rs1_data = 32'hFFFFFFFF; rs2_data = 32'h00000001; #10;
        if (branch_taken !== 1'b0) $display("FAIL: BGE (Signed -1 >= 1)"); else $display("PASS: BGE (Signed -1 < 1 evaluates false)");

        // Test 5: BLTU (Branch Less Than - Unsigned)
        // 0xFFFFFFFF is HUGE in unsigned arithmetic, so it is NOT less than 1
        funct3 = 3'b110; rs1_data = 32'hFFFFFFFF; rs2_data = 32'h00000001; #10;
        if (branch_taken !== 1'b0) $display("FAIL: BLTU (Unsigned MAX < 1)"); else $display("PASS: BLTU (Unsigned MAX is not < 1)");

        // Test 6: BGEU (Branch Greater/Equal - Unsigned)
        funct3 = 3'b111; rs1_data = 32'hFFFFFFFF; rs2_data = 32'h00000001; #10;
        if (branch_taken !== 1'b1) $display("FAIL: BGEU (Unsigned MAX >= 1)"); else $display("PASS: BGEU (Unsigned MAX >= 1)");

        $display("=================================================");
        $finish;
    end
endmodule