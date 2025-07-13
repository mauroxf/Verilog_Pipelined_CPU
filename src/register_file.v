//==============================================================
// File        : register_file.v
// Description : 32x32-bit general purpose register file
// Author      : Mauro Ferreira
//==============================================================

module register_file (
    input clk, rst,
    input [4:0]  rs1, rs2, rd,
    input [31:0] rd_data,
    input reg_write,
    output[31:0] rs1_data, rs2_data
);

    reg [31:0] regs [0:31]; // 32 registers

    integer i; // Loop index

    // Asynchronous read
    assign rs1_data = regs[rs1];
    assign rs2_data = regs[rs2];

    // Synchronous write + reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
              	regs[i] <= 32'b0;
                regs[1] <= 32'd10;  // x1
				regs[2] <= 32'd5;   // x2
				regs[3] <= 32'd7;   // x3
				regs[4] <= 32'd1;   // x4
				regs[5] <= 32'd2;   // x5
				regs[6] <= 32'd3;   // x6 
				regs[7] <= 32'd4;   // x7 
        end else if (reg_write && rd != 5'b00000) begin
            regs[rd] <= rd_data;
        end
    end

endmodule
