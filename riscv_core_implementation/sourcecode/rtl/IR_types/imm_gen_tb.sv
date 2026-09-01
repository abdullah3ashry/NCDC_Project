module imm_gen_tb;


    logic [31:0] inst;
    logic [31:0] imm;
  
	wire signed [31:0] signed_imm = imm;
  
  
    imm_gen dut (
        .inst(inst),
        .imm(imm)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, imm_gen_tb);


        inst = 32'h00F10093;
        #10;
        

        inst = 32'hFFC10093;
        #10;


        inst = 32'h00010093;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time = %0t | Instruction = %h | Extracted Immediate = %h (Signed Decimal: %0d)", 
                 $time, inst, imm, signed_imm);
    end

endmodule
