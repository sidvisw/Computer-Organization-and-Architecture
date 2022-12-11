`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:31 08/31/2022 
// Design Name: 
// Module Name:    CLA_4bit_Ripple 
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
module CLA_4bit_Ripple(A,B,cin,S,cout);
	input [3:0] A,B;
	input cin;
	output [3:0] S;
	output cout;
	
	wire[3:0] g,p,c;	    //internal wires

	// calculate propagate and generate
	assign g = A & B;
	assign p = A ^ B;

	// calculate the carry out for each bit addition
	assign c[0] = cin;
	assign c[1] = g[0] | (p[0] & cin);
	assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
	assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
	assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

	// calculate the output sum
	assign S = p ^ c;
endmodule
