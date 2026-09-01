`timescale 1ns/10ps

module imm_gen_tb;

    // 1. Declare Testbench Signals
    logic [31:0] inst;
    logic [31:0] imm;

    // 2. Instantiate the Immediate Generator (Device Under Test)
    imm_gen dut (
        .inst(inst),
        .imm(imm)
    );

    // 3. Test Sequence
    initial begin
        $display("--- Starting Immediate Generator Testbench ---");
        
        // ---------------------------------------------------------
        // Test 1: I-Type ALU Instruction
        // Example: addi x5, x0, -15
        // 12-bit Immediate: 1111_1111_0001 (-15)
        // ---------------------------------------------------------
        inst = 32'b111111110001_00000_000_00101_0010011;
        #10;
        if (imm !== 32'hFFFFFFF1) $display("FAIL: Test 1 (I-Type ALU). Got %h", imm);
        else $display("PASS: Test 1 (I-Type ALU). Extracted: %h (-15)", imm);

        // ---------------------------------------------------------
        // Test 2: I-Type Load Instruction
        // Example: lw x4, 20(x1)
        // 12-bit Immediate: 0000_0001_0100 (20)
        // ---------------------------------------------------------
        inst = 32'b000000010100_00001_010_00100_0000011;
        #10;
        if (imm !== 32'h00000014) $display("FAIL: Test 2 (I-Type Load). Got %h", imm);
        else $display("PASS: Test 2 (I-Type Load). Extracted: %h (20)", imm);

        // ---------------------------------------------------------
        // Test 3: S-Type Store Instruction
        // Example: sw x6, 20(x7)
        // Immediate is split: top 7 bits = 0000000, bottom 5 bits = 10100
        // ---------------------------------------------------------
        inst = 32'b0000000_00110_00111_010_10100_0100011;
        #10;
        if (imm !== 32'h00000014) $display("FAIL: Test 3 (S-Type Store). Got %h", imm);
        else $display("PASS: Test 3 (S-Type Store). Extracted: %h (20)", imm);

        // ---------------------------------------------------------
        // Test 4: J-Type Jump Instruction
        // Example: jal x1, ...
        // We use a specific scrambled bit pattern to ensure the wiring is correct
        // inst[31]=1, inst[30:21]=1010101010, inst[20]=0, inst[19:12]=11110000
        // Expected binary output after unscrambling, sign-extending, and appending 1'b0:
        // 1111_1111_1111_1111_0000_0101_0101_0100 (32'hFFFF0554)
        // ---------------------------------------------------------
        inst = 32'b1_1010101010_0_11110000_00001_1101111;
        #10;
        if (imm !== 32'hFFFF0554) $display("FAIL: Test 4 (J-Type Jump). Got %h", imm);
        else $display("PASS: Test 4 (J-Type Jump). Extracted: %h", imm);

        // ---------------------------------------------------------
        // Test 5: Default / R-Type Instruction
        // Example: add x1, x2, x3
        // Should default to outputting exactly 0.
        // ---------------------------------------------------------
        inst = 32'b0000000_00011_00010_000_00001_0110011;
        #10;
        if (imm !== 32'h00000000) $display("FAIL: Test 5 (R-Type). Got %h", imm);
        else $display("PASS: Test 5 (R-Type). Extracted: %h (0)", imm);

        $display("--- Testbench Complete ---");
        $finish;
    end

endmodule