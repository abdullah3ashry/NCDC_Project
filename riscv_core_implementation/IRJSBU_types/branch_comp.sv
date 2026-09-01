`timescale 1ns/10ps

module branch_comp (
    input  logic [2:0] funct3,
    input  logic       zero,
    input  logic       negative,
    input  logic       carry,
    input  logic       overflow,
    output logic       branch_taken
);

    always_comb begin
        case (funct3)
            3'b000: branch_taken = zero;                       // beq  (Z == 1)
            3'b001: branch_taken = ~zero;                      // bne  (Z == 0)
            3'b100: branch_taken = (negative != overflow);     // blt  (N != V)
            3'b101: branch_taken = (negative == overflow);     // bge  (N == V)
            3'b110: branch_taken = ~carry;                     // bltu (C == 0, requires borrow)
            3'b111: branch_taken = carry;                      // bgeu (C == 1, no borrow)
            default: branch_taken = 1'b0;
        endcase
    end

endmodule