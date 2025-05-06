module alu #(
    DATA_WIDTH = 32
)(
    logic input     [DATA_WIDTH-1:0]    op1,
    logic input     [DATA_WIDTH-1:0]    op2,
    logic input                         ctrl,
    logic output    [DATA_WIDTH-1:0]    out,
    logic output                        eq,
);
    always_comb begin
        case (ctrl)
            1'b1: out = op1 + op2;
            default: out = 32'b0;
        endcase
    end

    assign eq = (op1 == op2);

endmodule