module reg_file (
    input  logic        clk,
    input  logic        RegWEn,
    input logic rst,
    input  logic [4:0]  rs1,
    input  logic [4:0]  rs2,
    input  logic [4:0]  rsW,
    input  logic [31:0] dataW,
    output logic [31:0] data1,
    output logic [31:0] data2
);

    logic [31:0] registers [31:0];


    assign data1 = (rs1 == 5'b00000) ? 32'b0 : registers[rs1];
    assign data2 = (rs2 == 5'b00000) ? 32'b0 : registers[rs2];

    always_ff @(posedge clk) begin
	  if (rst) begin
		for (int i = 0; i < 32; i++) begin
            	registers[i] = 32'b0;
        	end
	  end
        else if (RegWEn) begin
            if (rsW != 5'b00000) begin
                registers[rsW] <= dataW;
            end
        end
    end

endmodule
