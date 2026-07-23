`timescale 1ns/10ps

module data_mem (
  	input logic         clk,
  	input logic         mem_read,
  	input logic         mem_write,
  	input logic  [31:0] addr,
  	input logic  [31:0] write_data,
  	output logic [31:0] read_data
);
  
  logic [31:0] memory [0:255];
  
  initial begin
    for (int i = 0; i < 256; i++) begin
      memory[i] = 32'b0;
    end
    
    memory[5] = 32'd42;
  end
  
  
  always_ff @(posedge clk) begin
    if (mem_write == 1'b1) begin
      memory[addr[31:2]] <= write_data;
    end
  end
  
  assign read_data = (mem_read) ? memory[addr[31:2]] : 32'b0;

endmodule
      
  
  
    
