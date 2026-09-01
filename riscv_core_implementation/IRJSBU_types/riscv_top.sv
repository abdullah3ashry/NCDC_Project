`timescale 1ns/10ps

module riscv_top (
  	input logic rst,
  	input logic clk
);
  
  

    logic [31:0] pc_current;
    logic [31:0] pc_next;
    logic [31:0] jump_target;
    logic [31:0] instruction;
    

  	logic [31:0] read_reg_data1;
  	logic [31:0] read_reg_data2;
  	logic [31:0] write_data_rf;
    

    logic [31:0] imm_extended;
    logic [31:0] alu_operand_a;
    logic [31:0] alu_operand_b;
    logic [31:0] alu_result;
    logic [3:0]  alu_ctrl_signal;
    logic        alu_zero;
    logic        alu_negative;
    logic        alu_carry;
    logic        alu_overflow;
    
    logic [31:0] raw_dmem_read;
    logic [31:0] formatted_dmem_read;
    logic [31:0] formatted_dmem_write;
    logic [3:0]  dmem_write_mask;

    logic [1:0] alu_op;
    logic       alu_src;
    logic       reg_write;
    logic       mem_read;
    logic       mem_write;
    logic       mem_to_reg;
    logic       jump;
    logic       branch;
    logic       a_sel;
    logic       branch_taken;
  
  
    
    assign jump_target = (instruction[6:0] == 7'b1100111) ? alu_result : (pc_current + imm_extended); 
  
    assign pc_next = (jump | (branch & branch_taken)) ? jump_target : (pc_current + 32'd4);
  
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
  
  
    assign write_data_rf = jump ? (pc_current + 32'd4) : (mem_to_reg ? formatted_dmem_read : alu_result);
  
  	reg_file reg_file_inst (
      	.clk(clk),
        .RegWEn(reg_write),
        .rst(rst),
        .rs1(instruction[19:15]),
      	.rs2(instruction[24:20]),
        .rsW(instruction[11:7]),
        .dataW(write_data_rf),
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
        .alu_src(alu_src),
        .jump(jump),
        .branch(branch),
        .a_sel(a_sel),
        .mem_read(mem_read),
        .mem_to_reg(mem_to_reg),
        .mem_write(mem_write)
  	);
  	
  	branch_comp branch_comp_inst (
        .funct3(instruction[14:12]),
        .zero(alu_zero),
        .negative(alu_negative),
        .carry(alu_carry),
        .overflow(alu_overflow),
        .branch_taken(branch_taken)
    );
  	
  	
    assign alu_operand_a = (a_sel) ? pc_current : read_reg_data1;
  	assign alu_operand_b = (alu_src) ? imm_extended : read_reg_data2;
  
  	alu alu_inst (
        .a(alu_operand_a),
        .b(alu_operand_b),
        .alu_ctrl(alu_ctrl_signal),
        .alu_result(alu_result),
        .zero(alu_zero),
        .negative(alu_negative),
        .carry(alu_carry),
        .overflow(alu_overflow)
  	);
  
  	alu_ctrl alu_ctrl_inst (
        .alu_op(alu_op),
        .funct3(instruction[14:12]),
        .funct7_5(instruction[30]),
        .alu_ctrl(alu_ctrl_signal)
  	);
  
  
    
    data_mem_ctrl  data_mem_ctrl_inst (
        .funct3(instruction[14:12]),
        .addr_lsb(alu_result[1:0]),
        .read_data_in(raw_dmem_read),
        .write_data_in(read_reg_data2),
        .read_data_out(formatted_dmem_read),
        .write_data_out(formatted_dmem_write),
        .write_mask(dmem_write_mask)
    );
  
  
    data_mem data_mem_inst (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .write_mask(dmem_write_mask),
        .addr(alu_result),
        .write_data(formatted_dmem_write),
        .read_data(raw_dmem_read)
    );
  
endmodule
