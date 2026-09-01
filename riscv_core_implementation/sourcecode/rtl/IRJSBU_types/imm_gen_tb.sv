`timescale 1ns/10ps

module imm_gen_tb;

    logic [31:0] inst;
    logic [31:0] imm;

    imm_gen dut (
        .inst(inst),
        .imm(imm)
    );

    initial begin
        $display("=================================================");
        $display("      Immediate Generator Testbench (Updated)    ");
        $display("=================================================");
        
        // Test 1: I-Type (addi x5, x0, -15)
        inst = 32'b111111110001_00000_000_00101_0010011;
        #10;
        if (imm !== 32'hFFFFFFF1) $display("FAIL: I-Type"); else $display("PASS: I-Type Extracted: %h", imm);

        // Test 2: S-Type (sw x6, 20(x7))
        inst = 32'b0000000_00110_00111_010_10100_0100011;
        #10;
        if (imm !== 32'h00000014) $display("FAIL: S-Type"); else $display("PASS: S-Type Extracted: %h", imm);

        // Test 3: J-Type (jal)
        inst = 32'b1_1010101010_0_11110000_00001_1101111;
        #10;
        if (imm !== 32'hFFFF0554) $display("FAIL: J-Type"); else $display("PASS: J-Type Extracted: %h", imm);

        // Test 4: B-Type (beq x0, x0, -8) -> offset is -8 (0xFFFFFFF8)
        // Imm[12]=1, Imm[10:5]=11111, Imm[4:1]=1100, Imm[11]=1
        inst = 32'b1_111111_00000_00000_000_1100_1_1100011;
        #10;
        if (imm !== 32'hFFFFFFF8) $display("FAIL: B-Type. Got %h", imm); else $display("PASS: B-Type Extracted: %h", imm);

        // Test 5: U-Type (lui x5, 0x12345)
        // Top 20 bits are 0x12345. Bottom 12 bits will be zero-padded.
        inst = 32'b00010010001101000101_00101_0110111;
        #10;
        if (imm !== 32'h12345000) $display("FAIL: U-Type. Got %h", imm); else $display("PASS: U-Type Extracted: %h", imm);

        $display("=================================================");
        $finish;
    end
endmodule