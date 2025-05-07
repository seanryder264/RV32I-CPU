module alu #(
    DATA_WIDTH = 32
)(
    input logic     [DATA_WIDTH-1:0]    op1,
    input logic     [DATA_WIDTH-1:0]    op2,
    input logic                         ctrl,
    output logic    [DATA_WIDTH-1:0]    out,
    output logic                        eq
);
    always_comb begin
        case (ctrl)
            1'b1: out = op1 + op2;
            default: out = 32'b0;
        endcase
    end

    assign eq = (op1 == op2);

endmodule