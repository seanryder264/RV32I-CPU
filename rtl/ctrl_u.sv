module ctrl_u (
    input   logic [11:0] in,
    input   logic        eq,
    output  logic reg_write,
    output  logic alu_ctrl,
    output  logic alu_src,
    output  logic imm_src,
    output  logic pc_src
);
endmodule