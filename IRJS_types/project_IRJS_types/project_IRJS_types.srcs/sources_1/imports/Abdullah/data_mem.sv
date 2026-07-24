`timescale 1ns/10ps

module data_mem (
  	input logic         clk,
  	input logic         mem_read,
  	input logic         mem_write,
  	input logic  [3:0]  write_mask,
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
        if (write_mask[0]) memory[addr[31:2]][7:0]   <= write_data[7:0];
        if (write_mask[1]) memory[addr[31:2]][15:8]  <= write_data[15:8];
        if (write_mask[2]) memory[addr[31:2]][23:16] <= write_data[23:16];
        if (write_mask[3]) memory[addr[31:2]][31:24] <= write_data[31:24];
    end
  end
  
  assign read_data = (mem_read) ? memory[addr[31:2]] : 32'b0;

endmodule
      
  
  
    
