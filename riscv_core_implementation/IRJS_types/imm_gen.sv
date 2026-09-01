module imm_gen (
    input  logic [31:0] inst,
    output logic [31:0] imm
);

    logic [6:0] opcode;
    assign opcode = inst[6:0];

    always_comb begin
        case (opcode)
            // I-Type: ALU (19), Loads (3), Jalr (103)
            7'b0010011, 7'b0000011, 7'b1100111: begin
                imm = {{20{inst[31]}}, inst[31:20]};
            end
            
            // S-Type: Stores (35)
            7'b0100011: begin
                // Extracts top 7 bits and bottom 5 bits, then sign-extends
                imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
            end

            // J-Type: Jal (111)
            7'b1101111: begin
                // Extracts the scrambled 20-bit immediate, sign-extends, and appends a 0
                imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
            end
            
            // R-Type and others (No immediate)
            default: begin
                imm = 32'b0;
            end
        endcase
    end

endmodule
