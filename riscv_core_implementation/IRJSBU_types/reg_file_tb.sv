module reg_file_tb;
  
    logic        clk;
    logic        RegWEn;
    logic [4:0]  rs1;
    logic [4:0]  rs2;
    logic [4:0]  rsW;
    logic [31:0] dataW;
    logic [31:0] data1;
    logic [31:0] data2;

    reg_file dut (
        .clk(clk),
        .RegWEn(RegWEn),
        .rs1(rs1),
        .rs2(rs2),
        .rsW(rsW),
        .dataW(dataW),
        .data1(data1),
        .data2(data2)
    );


    always #5 clk = ~clk;


    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, reg_file_tb);

        clk = 0;
        RegWEn = 0;
        rs1 = 0;
        rs2 = 0;
        rsW = 0;
        dataW = 0;

      
        #15;
        RegWEn = 1;
        rsW = 5'd5;
        dataW = 32'hDEADBEEF;
        #10;
        RegWEn = 0;


        #10;
        rs1 = 5'd5;


        #10;
        RegWEn = 1;
        rsW = 5'd0;
        dataW = 32'hFFFFFFFF;
        #10;
        RegWEn = 0;


        #10;
        rs1 = 5'd0;
        rs2 = 5'd5;
        
        #20 $finish;
    end

    initial begin
        $monitor("Time = %0t | clk = %b | RegWEn = %b | rsW = %d | dataW = %h | rs1 = %d -> data1 = %h | rs2 = %d -> data2 = %h", 
                 $time, clk, RegWEn, rsW, dataW, rs1, data1, rs2, data2);
    end

endmodule
