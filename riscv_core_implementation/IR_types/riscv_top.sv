`timescale 1ns/10ps

module riscv_top (
  	input logic rst,
  	input logic clk
);
  
  

    logic [31:0] pc_current;
    logic [31:0] pc_next;
    logic [31:0] instruction;
    

  	logic [31:0] read_reg_data1;
  	logic [31:0] read_reg_data2;
    

    logic [31:0] imm_extended;
    logic [31:0] alu_operand_b;
    logic [31:0] alu_result;
    logic [3:0]  alu_ctrl_signal;
    logic        alu_zero;
    

    logic [1:0] alu_op;
    logic       alu_src;
    logic       reg_write;
  
  
  	assign pc_next = pc_current + 32'd4;
  
  	program_counter pc_inst (
      	.clk(clk),
      	.rst(rst),
      	.pc_next(pc_next),
      	.pc(pc_current)
    );
  	
  	
  	i_mem i_mem_inst (
      	.addr(pc_current),
      	.word(instruction)
  	);
  
  	reg_file reg_file_inst (
      	.clk(clk),
        .RegWEn(reg_write),
        .rst(rst),
        .rs1(instruction[19:15]),
      	.rs2(instruction[24:20]),
        .rsW(instruction[11:7]),
        .dataW(alu_result),
      	.data1(read_reg_data1),
      	.data2(read_reg_data2)
    );
  
  	imm_gen imm_gen_inst (
        .inst(instruction),
        .imm(imm_extended)
    );
  
  	main_ctrl main_ctrl_inst (
        .opcode(instruction[6:0]),
        .reg_write(reg_write),
        .alu_op(alu_op),
        .alu_src(alu_src)
        //.mem_read(),
        //.mem_to_reg(),
        //.mem_write()
  	);
  
  	assign alu_operand_b = (alu_src) ? imm_extended : read_reg_data2;
  
  	alu alu_inst (
        .a(read_reg_data1),
        .b(alu_operand_b),
        .alu_ctrl(alu_ctrl_signal),
        .alu_result(alu_result),
        .zero(alu_zero)
  	);
  
  	alu_ctrl alu_ctrl_inst (
        .alu_op(alu_op),
        .funct3(instruction[14:12]),
        .funct7_5(instruction[30]),
        .alu_ctrl(alu_ctrl_signal)
  	);
  
  
endmodule
