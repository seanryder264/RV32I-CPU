module se (
    input   logic [11:0] in,
    input   logic                  src,
    output  logic [32:0] out
);

    always_comb begin
        case (src)
            1'b1: out = { {20{in[11]}}, in[11:0] };
            default: out = { {20{1'b0}}, in[11:0] };
        endcase
    end

endmodule