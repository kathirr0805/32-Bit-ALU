`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2024 11:54:04
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU (
    input [31:0] A, B,        // 32-bit inputs
    input [3:0] Op_Code,      // 4-bit operation selector
    output reg [31:0] Result, // 32-bit result
    output reg Zero, Carry, Overflow, Negative
);
    always @(*) begin
        // Initialize Flags
        Zero = 0; Carry = 0; Overflow = 0; Negative = 0;
        
        case (Op_Code)
            4'b0000: Result = A + B;                  // Addition
            4'b0001: Result = A - B;                  // Subtraction
            4'b0010: Result = A & B;                  // AND
            4'b0011: Result = A | B;                  // OR
            4'b0100: Result = A ^ B;                  // XOR
            4'b0101: Result = A << 1;                 // Logical Left Shift
            4'b0110: Result = A >> 1;                 // Logical Right Shift
            4'b0111: Result = $signed(A) >>> 1;       // Arithmetic Right Shift
            4'b1000: Result = (A == B) ? 32'd1 : 32'd0; // Equality Check
            4'b1001: Result = (A > B) ? 32'd1 : 32'd0; // Greater Than
            4'b1010: Result = (A < B) ? 32'd1 : 32'd0; // Less Than
            default: Result = 32'b0;                  // Default Case
        endcase

        // Set Flags
        Zero = (Result == 32'b0);                     // Zero Flag
        Negative = Result[31];                        // Negative Flag
        // Carry and Overflow can be set based on arithmetic operations
    end
endmodule