`timescale 1ns/10ps

module data_mem_tb;

    logic        clk;
    logic        mem_read;
    logic        mem_write;
    logic [31:0] addr;
    logic [31:0] write_data;
    wire  [31:0] read_data;

    data_mem dut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .addr(addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, data_mem_tb);

        mem_read   = 1'b0;
        mem_write  = 1'b0;
        addr       = 32'b0;
        write_data = 32'b0;
        #10;


        addr     = 32'd20; 
        mem_read = 1'b1;
        #10;
        mem_read = 1'b0;


        addr       = 32'd40;
        write_data = 32'd99;
        mem_write  = 1'b1;
        #10;
        mem_write  = 1'b0;

 
        addr     = 32'd40;
        mem_read = 1'b1;
        #10;

        $finish;
    end


    initial begin
        $monitor("Time=%0t | clk=%b | read=%b write=%b | addr=%0d | data_in=%0d | data_out=%0d", 
                 $time, clk, mem_read, mem_write, addr, write_data, read_data);
    end

endmodule
