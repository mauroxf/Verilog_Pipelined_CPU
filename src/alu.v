//==============================================================
// File        : alu.v
// Description : Arithmetic Logic Unit supporting R-type ops
// Author      : Mauro Ferreira
//==============================================================

module alu #(
    parameter ADD = 3'b000,  // Addition
    parameter SUB = 3'b001,  // Subtraction
    parameter AND = 3'b010,  // Bitwise AND
    parameter OR  = 3'b011,  // Bitwise OR
    parameter XOR = 3'b100,  // Bitwise XOR
    parameter SLL = 3'b101,  // Shift Left Logical
    parameter SRL = 3'b110,  // Shift Right Logical
    parameter SLT = 3'b111   // Set Less Than
)(
    input  [31:0] a, b,
    input  [2:0]  opcode, // ALU Control Select
    output reg [31:0] result
);

    always @(*) begin
        case (opcode)
            ADD : result = a + b;
            SUB : result = a - b;
            AND : result = a & b;
            OR  : result = a | b;
            XOR : result = a ^ b;
            SLL : result = a << b[4:0];            
            SRL : result = a >> b[4:0];
            SLT : result = (a < b) ? 32'd1 : 32'd0;
            default: result = 32'hDEADBEEF; // Invalid opcode input
        endcase
    end

endmodule
