module program_counter_tb;


    logic        clk;
    logic        rst;
    logic [31:0] pc_next;
    logic [31:0] pc;


    program_counter dut (
        .clk(clk),
        .rst(rst),
        .pc_next(pc_next),
        .pc(pc)
    );


    always #5 clk = ~clk;


    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, program_counter_tb);


        clk = 0;
        rst = 1;
        pc_next = 32'h0000_0000;


        #15 rst = 0;


        #10 pc_next = pc + 4;
        #10 pc_next = pc + 4;
        #10 pc_next = pc + 4;

        #10 pc_next = 32'h0000_00A4;
        
        #10 pc_next = pc + 4;

        #10 rst = 1;
        #10 rst = 0;

        #20 $finish;
    end

    initial begin
        $monitor("Time = %0t | rst = %b | pc_next = %h | pc = %h", $time, rst, pc_next, pc);
    end

endmodule
