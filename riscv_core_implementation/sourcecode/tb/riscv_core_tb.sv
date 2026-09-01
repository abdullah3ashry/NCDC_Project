`timescale 1ns/1ps

module riscv_core_tb;

    // 1. Declare Testbench Signals
    logic clk;
    logic rst;
    
    // Inputs to DUT
    logic [31:0] instruction;
    logic [31:0] raw_dmem_read;

    // Outputs from DUT (Must be 'wire' for Gate-Level Simulation)
    wire [31:0] pc_current;
    wire [31:0] alu_result;      
    wire [31:0] formatted_dmem_write;
    wire [3:0]  dmem_write_mask; 
    wire        mem_read;
    wire        mem_write;         

    // 2. Instantiate the Core (Device Under Test)
    riscv_core dut (
        .clk(clk),
        .rst(rst),
        .pc_current(pc_current),
        .instruction(instruction),
        .alu_result(alu_result),
        .formatted_dmem_write(formatted_dmem_write),
        .dmem_write_mask(dmem_write_mask),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .raw_dmem_read(raw_dmem_read)
    );

    // 3. Dump Waveforms FIRST using Cadence Native SHM
    initial begin
        $shm_open("waves.shm");
        // "AS" dumps All Signals in this module, but prevents crashing 
        // by avoiding diving into the internal TSMC standard cell primitives.
        $shm_probe(riscv_core_tb, "AS"); 
    end

    // 4. SDF Back-Annotation
    initial begin
        $sdf_annotate("/home/cc/Documents/Abdullah/RISCV_synthesis/export/Synthesis_Data/outputs/riscv_core_physical_synth_agg_clk.sdf", dut);
    end

    // 5. Clock Generation
    always #2.865 clk = ~clk;

    // 6. Mock Memories
    logic [31:0] instr_mem [0:255];
    logic [31:0] data_mem  [0:255];

    // Safe Instruction Fetch
    always_comb begin
        if (pc_current === 32'bx || pc_current === 32'bz) begin
            instruction = 32'h00000013; // NOP
        end else begin
            instruction = instr_mem[pc_current[9:2]];
        end
    end

    // Safe Data Read
    always_comb begin
        if (alu_result === 32'bx || alu_result === 32'bz) begin
            raw_dmem_read = 32'b0;
        end else begin
            raw_dmem_read = data_mem[alu_result[9:2]];
        end
    end

    // Data Memory Write
    always_ff @(posedge clk) begin
        if (mem_write === 1'b1 && alu_result !== 32'bx) begin
            if (dmem_write_mask == 4'b1111) begin
                data_mem[alu_result[9:2]] <= formatted_dmem_write;
            end
        end
    end

    // 7. Test Sequence
    initial begin
        $display("=================================================");
        $display("     Starting RISC-V Core Gate-Level Simulation  ");
        $display("=================================================");
        
        for (int i=0; i<256; i++) instr_mem[i] = 32'h00000013;
        for (int i=0; i<256; i++) data_mem[i]  = 32'h0;

        clk = 0;
        rst = 1; 

        #50; 
        rst = 0; 

        #500; 

        $display("=================================================");
        $display("          Simulation Complete                    ");
        $display("=================================================");
        $finish;
    end

endmodule
