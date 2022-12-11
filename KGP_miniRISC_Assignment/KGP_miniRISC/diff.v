`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:31 10/27/2022 
// Design Name: 
// Module Name:    diff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module diff(A, B, out, eq);
    input [31:0] A, B;
    output signed [4:0] out;
	 output reg eq;

    wire [31:0] Xor1, Xor2, N, in;

    adder Add(.A(Xor1), .B(32'b11111111111111111111111111111111), .cin(1'b0), .S(Xor2), .carry());
    encoder_32x5 encoder(.in(in), .out(out));
    
    assign Xor1 = A ^ B;
    assign N = Xor1 ^ Xor2;
    assign in = N & Xor1;
	 
	 always @(*) begin
        if (A == B)
            eq = 1;
        else
            eq = 0;
    end
endmodule
