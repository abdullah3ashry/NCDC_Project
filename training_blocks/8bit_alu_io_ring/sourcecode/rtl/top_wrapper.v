module top_wrapper (
    // Physical Chip Pins
    input  [7:0] A,
    input  [7:0] B,
    input  [1:0] Sel,
    input        clk_in,
    input        rst,
    output  [7:0] Out
);

    // Internal wires
    wire [7:0] wA, wB, wOut;
    wire [1:0] wSel;
    wire       wclk, wrst;

    // 1. CLOCK PAD
    PDXOE3DG clk_pad (.E(1'b1), .XIN(clk_in), .XOUT(), .XC(wclk));

    // 2. RESET PAD
    PDDW16DGZ rst_inst (.OEN(1'b1), .I(1'b1), .PAD(rst), .REN(1'b1), .C(wrst));

    // 3. INPUT PADS (A[7:0], B[7:0]) - Flattened
    PDDW16DGZ A_inst0 (.OEN(1'b1), .I(1'b1), .PAD(A[0]), .REN(1'b1), .C(wA[0]));
    PDDW16DGZ A_inst1 (.OEN(1'b1), .I(1'b1), .PAD(A[1]), .REN(1'b1), .C(wA[1]));
    PDDW16DGZ A_inst2 (.OEN(1'b1), .I(1'b1), .PAD(A[2]), .REN(1'b1), .C(wA[2]));
    PDDW16DGZ A_inst3 (.OEN(1'b1), .I(1'b1), .PAD(A[3]), .REN(1'b1), .C(wA[3]));
    PDDW16DGZ A_inst4 (.OEN(1'b1), .I(1'b1), .PAD(A[4]), .REN(1'b1), .C(wA[4]));
    PDDW16DGZ A_inst5 (.OEN(1'b1), .I(1'b1), .PAD(A[5]), .REN(1'b1), .C(wA[5]));
    PDDW16DGZ A_inst6 (.OEN(1'b1), .I(1'b1), .PAD(A[6]), .REN(1'b1), .C(wA[6]));
    PDDW16DGZ A_inst7 (.OEN(1'b1), .I(1'b1), .PAD(A[7]), .REN(1'b1), .C(wA[7]));

    PDDW16DGZ B_inst0 (.OEN(1'b1), .I(1'b1), .PAD(B[0]), .REN(1'b1), .C(wB[0]));
    PDDW16DGZ B_inst1 (.OEN(1'b1), .I(1'b1), .PAD(B[1]), .REN(1'b1), .C(wB[1]));
    PDDW16DGZ B_inst2 (.OEN(1'b1), .I(1'b1), .PAD(B[2]), .REN(1'b1), .C(wB[2]));
    PDDW16DGZ B_inst3 (.OEN(1'b1), .I(1'b1), .PAD(B[3]), .REN(1'b1), .C(wB[3]));
    PDDW16DGZ B_inst4 (.OEN(1'b1), .I(1'b1), .PAD(B[4]), .REN(1'b1), .C(wB[4]));
    PDDW16DGZ B_inst5 (.OEN(1'b1), .I(1'b1), .PAD(B[5]), .REN(1'b1), .C(wB[5]));
    PDDW16DGZ B_inst6 (.OEN(1'b1), .I(1'b1), .PAD(B[6]), .REN(1'b1), .C(wB[6]));
    PDDW16DGZ B_inst7 (.OEN(1'b1), .I(1'b1), .PAD(B[7]), .REN(1'b1), .C(wB[7]));

    // Select Pins
    PDDW16DGZ sel_inst0 (.OEN(1'b1), .I(1'b1), .PAD(Sel[0]), .REN(1'b1), .C(wSel[0]));
    PDDW16DGZ sel_inst1 (.OEN(1'b1), .I(1'b1), .PAD(Sel[1]), .REN(1'b1), .C(wSel[1]));

    // 4. CORE LOGIC
    ALU u_alu_core (.Out(wOut), .A(wA), .B(wB), .Sel(wSel), .clk(wclk), .rst(wrst));

    // 5. OUTPUT PADS (Out[7:0]) - Flattened
    PDDW16DGZ out_inst0 (.OEN(1'b0), .I(wOut[0]), .PAD(Out[0]), .REN(1'b0), .C());
    PDDW16DGZ out_inst1 (.OEN(1'b0), .I(wOut[1]), .PAD(Out[1]), .REN(1'b0), .C());
    PDDW16DGZ out_inst2 (.OEN(1'b0), .I(wOut[2]), .PAD(Out[2]), .REN(1'b0), .C());
    PDDW16DGZ out_inst3 (.OEN(1'b0), .I(wOut[3]), .PAD(Out[3]), .REN(1'b0), .C());
    PDDW16DGZ out_inst4 (.OEN(1'b0), .I(wOut[4]), .PAD(Out[4]), .REN(1'b0), .C());
    PDDW16DGZ out_inst5 (.OEN(1'b0), .I(wOut[5]), .PAD(Out[5]), .REN(1'b0), .C());
    PDDW16DGZ out_inst6 (.OEN(1'b0), .I(wOut[6]), .PAD(Out[6]), .REN(1'b0), .C());
    PDDW16DGZ out_inst7 (.OEN(1'b0), .I(wOut[7]), .PAD(Out[7]), .REN(1'b0), .C());

endmodule