`timescale 1ns/10ps
module ALU(Out, A, B, Sel, clk, rst);
    input [7:0] A, B;
    input [1:0] Sel;
    input clk, rst;
    output reg [7:0] Out;

    wire [7:0] M1, A1, N1, N2;
    reg  [7:0] M_Out;

    assign M1 = A & B;   // AND
    assign A1 = A | B;   // OR
    assign N1 = ~A;      // NOT A
    assign N2 = ~B;      // NOT B

    always @(posedge clk) begin
        if (!rst) 
            Out <= 8'b0;
        else 
            Out <= M_Out;
    end

    always @(*) begin
        case (Sel)
            2'b00 : M_Out = M1;
            2'b01 : M_Out = A1;
            2'b10 : M_Out = N1;
            2'b11 : M_Out = N2;
        endcase
    end
endmodule
