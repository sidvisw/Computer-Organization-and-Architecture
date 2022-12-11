`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:44:41 09/13/2022 
// Design Name: 
// Module Name:    counter_4_bit 
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
module counter_4_bit(clk, rst, out);
	input clk, rst;
	output reg[3:0] out;
	
	wire clk_out;
	clock_divider cd(.clk_in(clk),.clk_out(clk_out));
	always @(posedge clk_out or posedge rst)
	begin
		if(rst)
			out<=0;
		else
			out<=out+1;
	end
endmodule
