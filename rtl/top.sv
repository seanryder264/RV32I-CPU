module top #(
    DATA_WIDTH = 32
)(
    input   logic                   clk,
    input   logic                   rst,
    output  logic [DATA_WIDTH-1:0]  a0
);
    assign a0 = 32'd5;

    always_comb begin
        branch_pc = pc + imm_op;
        inc_pc = pc + 4;
    end

    alu #(
        .DATA_WIDTH(DATA_WIDTH)
    ) alu (
        .op1(alu_op1),
        .op2(alu_op2),
        .ctrl(alu_ctrl),
        .out(alu_out),
        .eq(eq)
    )

    cltr_u ctrl_u (
        .in(instr[]),
        .eq(eq),
        .reg_write(reg_write),
        .alu_ctrl(alu_ctrl),
        .alu_src(alu_src),
        .imm_src(imm_src),
        .pc_src(pc_src)
    )

    instr_mem #(
        .DATA_WIDTH(DATA_WIDTH)
    ) instr_mem (
        .a(pc),
        .rd(instr[])
    )

    mux #(
        .DATA_WIDTH(DATA_WIDTH)
    ) alu_src (
        .in0(reg_op2),
        .in1(imm_op),
        .sel(alu_src),
        .out(alu_op2)
    )

    mux #(
        .DATA_WIDTH(DATA_WIDTH)
    ) pc_src (
        .in0(branch_pc),
        .in1(inc_pc),
        .sel(pc_src),
        .out(next_pc)
    )

    pc_reg #(
        .DATA_WIDTH(DATA_WIDTH)
    ) pc_reg (
        .clk(clk),
        .rst(rst),
        .a(next_pc),
        .rd(pc)
    )

    reg_file #(
        .DATA_WIDTH(DATA_WIDTH)
    ) reg_file (
        .clk(clk),
        .ad1(rs1),
        .ad2(rs2),
        .ad2(rd),
        .we3(reg_write),
        .wd3(alu_out),
        .rd1(alu_op1),
        .rd2(reg_op2),
        .a0(a0)
    )

    se se (
        .in(instr[]),
        .src(imm_src),
        .out(imm_op)
    )
    
endmodule