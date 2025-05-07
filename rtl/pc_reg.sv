module pc_reg #(
    parameter DATA_WIDTH = 32
)(
    input   logic                   clk,
    input   logic                   rst,
    input   logic [DATA_WIDTH-1:0]  a,
    output  logic [DATA_WIDTH-1:0]  rd
);
    always_ff @(posedge clk or posedge rst) begin
        if (rst) rd <= 32'd0;
        else rd <= a;
    end

endmodule