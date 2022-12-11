`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:54 10/21/2022 
// Design Name: 
// Module Name:    Lookahead_Carry_Unit 
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
module Lookahead_Carry_Unit(G, P, cin, cout, pout, gout);
	input [3:0] G, P;				      //inputs
	input cin;					         //input
	output [3:0] cout;
	output pout, gout;	//outputs

	// calculate the carry out
	assign cout[0] = G[0] | (P[0] & cin);
	assign cout[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
	assign cout[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
	assign cout[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);

	// calculate the next signal of the block
	assign pout = P[3] & P[2] & P[1] & P[0];
	assign gout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
endmodule
