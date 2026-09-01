`timescale 1ns/10ps

module main_ctrl (
  	input logic  [6:0]  opcode,
  	output logic 		reg_write,
  	output logic [1:0]  alu_op,
  	output logic 		alu_src,
	output logic 		mem_read,
  	output logic 		mem_to_reg,
  	output logic 		mem_write,
  	output logic        jump
);
  
  
  always_comb begin
    

    reg_write  = 1'b0;
    alu_op 	   = 2'b00;
    alu_src    = 1'b0;
    mem_read   = 1'b0;
    mem_to_reg = 1'b0;
    mem_write  = 1'b0;
    jump       = 1'b0;
    
    case(opcode)
        7'b0110011: begin //R type
          reg_write  = 1'b1;
          alu_src    = 1'b0;
          alu_op     = 2'b10;
        end

        7'b0010011: begin //I type arithmetic
          alu_src    = 1'b1;
          reg_write  = 1'b1;
          alu_op     = 2'b11;
        end


        7'b0000011: begin //I type loads
          alu_src    = 1'b1;
          mem_to_reg = 1'b1;
          reg_write  = 1'b1;
          mem_read   = 1'b1;
          alu_op     = 2'b00;
        end


        7'b0100011: begin //S type
          reg_write  = 1'b0;
          alu_src    = 1'b1;
          mem_write  = 1'b1;
          alu_op     = 2'b00;
        end
        
        
        7'b1101111: begin //J type (jal)
            reg_write  = 1'b1;
            jump       = 1'b1;
        end


        7'b1100111: begin //I type jump (jalr)
            reg_write  = 1'b1;    
            jump       = 1'b1;    
            alu_src    = 1'b1;
            alu_op     = 2'b00;
        end


        default: ;
      
     endcase
    
   end
  
endmodule
