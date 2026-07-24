`timescale 1ns/10ps

module data_mem_ctrl (
    input  logic [2:0]  funct3,
    input  logic [1:0]  addr_lsb,
    input  logic [31:0] read_data_in,
    input  logic [31:0] write_data_in,
    
    output logic [31:0] read_data_out,
    output logic [31:0] write_data_out,
    output logic [3:0]  write_mask
);


    logic [7:0]  extracted_byte;
    logic [15:0] extracted_half;

    always_comb begin
        // Extract the correct byte based on the lowest 2 bits of the address
        case (addr_lsb)
            2'b00: extracted_byte = read_data_in[7:0];
            2'b01: extracted_byte = read_data_in[15:8];
            2'b10: extracted_byte = read_data_in[23:16];
            2'b11: extracted_byte = read_data_in[31:24];
        endcase

        // Extract the correct half-word based on bit 1 of the address
        case (addr_lsb[1])
            1'b0: extracted_half = read_data_in[15:0];
            1'b1: extracted_half = read_data_in[31:16];
        endcase

        // Apply Sign/Zero Extension based on funct3
        case (funct3)
            3'b000: read_data_out = {{24{extracted_byte[7]}}, extracted_byte};   // lb  (Sign-extend byte)
            3'b001: read_data_out = {{16{extracted_half[15]}}, extracted_half};  // lh  (Sign-extend half)
            3'b010: read_data_out = read_data_in;                                // lw  (Pass full word)
            3'b100: read_data_out = {24'b0, extracted_byte};                     // lbu (Zero-extend byte)
            3'b101: read_data_out = {16'b0, extracted_half};                     // lhu (Zero-extend half)
            default: read_data_out = 32'b0;
        endcase
    end


    always_comb begin
        write_data_out = 32'b0;
        write_mask     = 4'b0000;

        case (funct3)
            3'b000: begin // sb (Store Byte)
                write_data_out = {4{write_data_in[7:0]}}; // Copy byte to all 4 positions
                case (addr_lsb)
                    2'b00: write_mask = 4'b0001;
                    2'b01: write_mask = 4'b0010;
                    2'b10: write_mask = 4'b0100;
                    2'b11: write_mask = 4'b1000;
                endcase
            end
            
            3'b001: begin // sh (Store Halfword)
                write_data_out = {2{write_data_in[15:0]}}; // Copy halfword to both positions
                case (addr_lsb[1])
                    1'b0: write_mask = 4'b0011;
                    1'b1: write_mask = 4'b1100;
                endcase
            end
            
            3'b010: begin // sw (Store Word)
                write_data_out = write_data_in;
                write_mask     = 4'b1111; // Enable all 4 bytes
            end
            
            default: begin
                write_data_out = 32'b0;
                write_mask     = 4'b0000;
            end
        endcase
    end
 endmodule