`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:13:56 10/21/2022 
// Design Name: 
// Module Name:    CLA_4bit 
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
module CLA_4bit(A, B, cin, S, P, G);
	input [3:0] A, B;	    //inputs
	input cin;		       //input
	output [3:0] S;	    //output
	output P, G;	       //outputs

	wire[3:0] g,p,c;	    //internal wires

	// calculate propagate and generate
	assign g = A & B;
	assign p = A ^ B;

	// calculate the carry out for each bit addition
	assign c[0] = cin;
	assign c[1] = g[0] | (p[0] & cin);
	assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
	assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);

	// calculate the P and G for furthur addition
	assign P = p[3] & p[2] & p[1] & p[0];
	assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

	// calculate the output sum
	assign S = p ^ c;
endmodule
