`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:05 01/15/2021 
// Design Name: 
// Module Name:    half_addr 
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
module half_addr(a,b,cout,sum);
	input a,b;			// Inputs
	output cout,sum;	// Outputs
	
	// Instantiated XOR and AND module
	xor U1(sum,a,b);
	and U2(cout,a,b);
endmodule