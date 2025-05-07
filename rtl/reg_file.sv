module reg_file #(
    DATA_WIDTH = 32
)(
    input logic clk,
    input logic [DATA_WIDTH-1:0] ad1,
    input logic [DATA_WIDTH-1:0] ad2,
    input logic [DATA_WIDTH-1:0] ad3,
    input logic we3,
    input logic [DATA_WIDTH-1:0] wd3,
    output logic [DATA_WIDTH-1:0] rd1,
    output logic [DATA_WIDTH-1:0] rd2,
    output logic [DATA_WIDTH-1:0] a0
);
    logic [DATA_WIDTH-1:0] rf [0:31];

    always_ff @(posedge clk) begin
        if (we3) rf[ad3] <= wd3;
        rd1 <= rf[ad1];
        rd2 <= rf[ad2];
        a0 <= rf[32'd0];
    end

endmodule
