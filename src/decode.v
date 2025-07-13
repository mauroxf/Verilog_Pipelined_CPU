//==============================================================
// File        : decode.v
// Description : Instruction decode + register file access
// Author      : Mauro Ferreira
//==============================================================

module decode (
    input clk, rst,
    input [31:0] instruction,
    input [31:0] rd_data,     
    input reg_write,   

    output [2:0] alu_op,      // ALU opcode
    output [31:0] rs1_data, rs2_data,
    output [4:0]  rd, rs1, rs2
);

    assign rs1 = instruction[19:15];
    assign rs2 = instruction[24:20];
    assign rd  = instruction[11:7];

    
    assign alu_op = instruction[14:12]; // Basic ALU control (same as funct3 in RISC-V)

    // Instantiate register_file.v
    register_file rf (
        .clk(clk),
        .rst(rst),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .rd_data(rd_data),
        .reg_write(reg_write),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

endmodule
