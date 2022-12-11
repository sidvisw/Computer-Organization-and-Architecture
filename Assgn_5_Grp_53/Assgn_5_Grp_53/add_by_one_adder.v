`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:46 09/14/2022 
// Design Name: 
// Module Name:    add_by_one_adder 
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
module add_by_one_adder(A, S);
	input [3:0] A;	    //inputs
	output [3:0] S;	    //output

	wire[3:0] p,c;	    //internal wires

	// calculate the carry out for each bit addition
	assign c[0] = 0;
	assign c[1] = A[0];
	assign c[2] = A[1] & A[0];
	assign c[3] = A[2] & A[1] & A[0];

	// calculate the p
	assign p[3:1] = A[3:1];
	assign p[0] = ~A[0];

	// calculate the output sum
	assign S = p ^ c;
endmodule
