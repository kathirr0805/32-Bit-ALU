`timescale 1ns / 1ps

module ALU_tb;
    // Inputs
    reg [31:0] A, B;
    reg [3:0] Op_Code;

    // Outputs
    wire [31:0] Result;
    wire Zero, Carry, Overflow, Negative;

    // Instantiate the ALU module
    ALU uut (
        .A(A),
        .B(B),
        .Op_Code(Op_Code),
        .Result(Result),
        .Zero(Zero),
        .Carry(Carry),
        .Overflow(Overflow),
        .Negative(Negative)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        A = 0; B = 0; Op_Code = 0;

        // Monitor outputs
        $monitor("Time=%0t | A=%d, B=%d, Op_Code=%b | Result=%d, Zero=%b, Negative=%b", 
                 $time, A, B, Op_Code, Result, Zero, Negative);

        // Test Addition
        A = 32'd10; B = 32'd15; Op_Code = 4'b0000; #10;
        
        // Test Subtraction
        A = 32'd20; B = 32'd25; Op_Code = 4'b0001; #10;
        
        // Test AND
        A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; Op_Code = 4'b0010; #10;

        // Test OR
        A = 32'hF0F0F0F0; B = 32'h0F0F0F0F; Op_Code = 4'b0011; #10;

        // Test XOR
        A = 32'hAAAA5555; B = 32'h5555AAAA; Op_Code = 4'b0100; #10;

        // Test Logical Left Shift
        A = 32'd8; Op_Code = 4'b0101; #10;

        // Test Logical Right Shift
        A = 32'd8; Op_Code = 4'b0110; #10;

        // Test Arithmetic Right Shift
        A = -32'd16; Op_Code = 4'b0111; #10;

        // Test Equality Check
        A = 32'd50; B = 32'd50; Op_Code = 4'b1000; #10;

        // Test Greater Than
        A = 32'd60; B = 32'd50; Op_Code = 4'b1001; #10;

        // Test Less Than
        A = 32'd40; B = 32'd50; Op_Code = 4'b1010; #10;

        // Test Default Case
        Op_Code = 4'b1111; #10;

        // End simulation
        $stop;
    end
endmodule
