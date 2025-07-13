//==============================================================
// File        : execute.v
// Description : ALU operation stage of pipeline
// Author      : Mauro Ferreira
//==============================================================

module execute (
    input [31:0] rs1_data, rs2_data,
    input [2:0]  alu_op,

    output [31:0] result
);

    // Instantiate alu.v
    alu alu_inst (
        .a(rs1_data),
        .b(rs2_data),
        .opcode(alu_op),
        .result(result)
    );

endmodule
