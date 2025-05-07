module instr_mem #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 12
)(
    input   logic [ADDR_WIDTH-1:0] a,
    output  logic [DATA_WIDTH-1:0] rd
);

    logic [DATA_WIDTH-1:0] mem [0:2**ADDR_WIDTH-1];

    initial begin
        $readmemh("instr_mem.txt", mem);
    end

    always_comb begin
        rd = mem[a];
    end
    
endmodule