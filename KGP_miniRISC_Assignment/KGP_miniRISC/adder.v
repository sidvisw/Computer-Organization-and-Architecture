`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:19 10/21/2022 
// Design Name: 
// Module Name:    adder 
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
module adder(A, B, cin, S, carry);
    input [31:0] A, B;  // inputs
	 input cin;          // input
    output [31:0] S;    // output
    output carry;       // output
	 
	 wire cout, P, G, p, g;
    CLA_16bit cla_16bit_1(.A(A[15:0]), .B(B[15:0]), .cin(cin), .S(S[15:0]), .P(P), .G(G));
	 CLA_16bit cla_16bit_2(.A(A[31:16]), .B(B[31:16]), .cin(cout), .S(S[31:16]), .P(p), .G(g));
	 assign cout = G | (P & cin);
	 assign carry = g | (p & cout);
endmodule
