`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:12 11/09/2022 
// Design Name: 
// Module Name:    wrapper_RISC 
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
module wrapper_RISC(clk, rst, select, inp, out);
	input clk, rst, select;
	input [9:0] inp;
	output [15:0] out;
	
	RISC risc(.clk(clk), .rst(rst), .select(select), .inp(inp), .out(out));
endmodule
