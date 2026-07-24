module i_mem (
    input  logic [31:0] addr,
    output logic [31:0] word
);


    logic [31:0] memory [0:63];


    initial begin
        $readmemh("instructions.mem", memory);
    end

    assign word = memory[addr[31:2]];

endmodule
