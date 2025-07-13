//==============================================================
// File        : top_module.v
// Description : Top-level module connecting all pipeline stages
// Author      : Mauro Ferreira
//==============================================================

module top_module (
    input clk,
    input rst
);

    // Fetch stage wires
    wire [31:0] pc;
    wire [31:0] instruction;

    // Decode stage wires
    wire [31:0] rs1_data, rs2_data;
    wire [4:0] rd, rs1, rs2;
    wire [2:0] alu_op;

    // Execute stage wires
    wire [31:0] alu_result;

    // Writeback control
    wire reg_write = 1'b1;            // Always enabled
    wire [31:0] rd_data = alu_result; // ALU result written back

    // FETCH STAGE
    fetch fetch_stage (
        .clk(clk),
        .rst(rst),
        .pc(pc),
        .instruction(instruction)
    );

    // DECODE STAGE
    decode decode_stage (
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .rd_data(rd_data),
        .reg_write(reg_write),
        .alu_op(alu_op),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2)
    );

    // EXECUTE STAGE
    execute execute_stage (
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .alu_op(alu_op),
        .result(alu_result)
    );

endmodule
