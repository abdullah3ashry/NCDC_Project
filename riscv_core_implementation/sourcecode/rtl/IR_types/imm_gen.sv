module imm_gen (
    input  logic [31:0] inst,
    output logic [31:0] imm
);


    assign imm = {{20{inst[31]}}, inst[31:20]};

endmodule
