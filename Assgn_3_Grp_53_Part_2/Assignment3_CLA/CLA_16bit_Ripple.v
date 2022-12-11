`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:02 08/30/2022 
// Design Name: 
// Module Name:    CLA_16bit_Ripple 
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
module CLA_16bit_Ripple(A, B, cin, S, cout);
	input [15:0] A, B;	// inputs
	input cin;			   // input
	output [15:0] S;	   // output
	output cout;	// outputs

	wire [2:0] c;	// internal wires

	// instantiating 4 4-bit carry look-ahead adders
	CLA_4bit_Ripple cla_4bit_0(.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .cout(c[0]));
	CLA_4bit_Ripple cla_4bit_1(.A(A[7:4]), .B(B[7:4]), .cin(c[0]), .S(S[7:4]), .cout(c[1]));
	CLA_4bit_Ripple cla_4bit_2(.A(A[11:8]), .B(B[11:8]), .cin(c[1]), .S(S[11:8]), .cout(c[2]));
	CLA_4bit_Ripple cla_4bit_3(.A(A[15:12]), .B(B[15:12]), .cin(c[2]), .S(S[15:12]), .cout(cout));
endmodule
