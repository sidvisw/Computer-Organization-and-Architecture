`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:42:24 11/07/2022 
// Design Name: 
// Module Name:    d_flip_flop 
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
module d_flip_flop(clk, rst, inp, out);
	input clk, rst, inp;
	output reg out;
	
	always @(posedge clk or posedge rst) begin
		if (rst)
			out <= 1'b0;
		else
			out <= inp;
	end
endmodule
