`timescale 1ns/10ps

module data_mem (
  	input logic         clk,
  	input logic         mem_read,
  	input logic         mem_write,
  	input logic  [31:0] addr,
  	input logic  [31:0] write_data,
  	output logic [31:0] read_data
);
  
  logic [31:0] memory [0:1023];
  
  initial begin
    $readmemh("data.mem", memory);
  end
  
  
  always_ff @(posedge clk) begin
    if (mem_write == 1'b1) begin
      memory[addr[11:2]] <= write_data;
    end
  end
  
  assign read_data = (mem_read) ? memory[addr[11:2]] : 32'b0;

endmodule
      
  
  
    
