`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:39 10/21/2022 
// Design Name: 
// Module Name:    CLA_16bit 
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
module CLA_16bit(A, B, cin, S, P, G);
	input [15:0] A, B;	// inputs
	input cin;			   // input
	output [15:0] S;	   // output
	output P, G;	// outputs

	wire [3:0] p, g, c;	// internal wires

	// instantiating 4 4-bit carry look-ahead adders
	CLA_4bit cla_4bit_0(.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .P(p[0]), .G(g[0]));
	CLA_4bit cla_4bit_1(.A(A[7:4]), .B(B[7:4]), .cin(c[0]), .S(S[7:4]), .P(p[1]), .G(g[1]));
	CLA_4bit cla_4bit_2(.A(A[11:8]), .B(B[11:8]), .cin(c[1]), .S(S[11:8]), .P(p[2]), .G(g[2]));
	CLA_4bit cla_4bit_3(.A(A[15:12]), .B(B[15:12]), .cin(c[2]), .S(S[15:12]), .P(p[3]), .G(g[3]));

	// instantiating the lookahead carry unit
	Lookahead_Carry_Unit lca(.G(g), .P(p), .cin(cin), .cout(c), .pout(P), .gout(G));
endmodule
