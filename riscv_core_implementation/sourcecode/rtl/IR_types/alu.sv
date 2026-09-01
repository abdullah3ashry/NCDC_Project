`timescale 1ns/10ps
module alu (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic [3:0]  alu_ctrl,
    output logic [31:0] alu_result,
    output logic        zero
);

    always_comb begin
        case (alu_ctrl)
            4'b0000: alu_result = a & b;
            4'b0001: alu_result = a | b;
            4'b0010: alu_result = a + b;
            4'b0110: alu_result = a - b;
            4'b0011: alu_result = a ^ b;
            4'b0100: alu_result = a << b[4:0];
            4'b0101: alu_result = a >> b[4:0];
            4'b0111: alu_result = $signed(a) >>> b[4:0];
            4'b1000: alu_result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;
            4'b1001: alu_result = (a < b) ? 32'd1 : 32'd0;
            default: alu_result = 32'b0;
        endcase
    end

    assign zero = (alu_result == 32'b0) ? 1'b1 : 1'b0;

endmodule
