module i_mem_tb;


    logic [31:0] addr;
    logic [31:0] word;

    i_mem dut (
        .addr(addr),
        .word(word)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, i_mem_tb);

        addr = 32'h0000_0000;
        #10;
        
        addr = 32'h0000_0004;
        #10;
        
        addr = 32'h0000_0008;
        #10;

        addr = 32'h0000_000C;
        #10;

        addr = 32'h0000_0020;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time = %0t | PC Address = %d | Instruction Output = %h", $time, addr, word);
    end

endmodule
