`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:12 09/14/2022 
// Design Name: 
// Module Name:    counter_4_bit_structural 
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
module counter_4_bit_structural(clk, rst, out);
	input clk, rst;
	output [3:0] out;
	
	wire clk_out;
	wire[3:0] input_dff,output_dff;
	clock_divider cd(.clk_in(clk),.clk_out(clk_out));
	D_Flip_Flop dff1(.clk(clk_out),.rst(rst),.D(input_dff[0]),.Q(output_dff[0]));
	D_Flip_Flop dff2(.clk(clk_out),.rst(rst),.D(input_dff[1]),.Q(output_dff[1]));
	D_Flip_Flop dff3(.clk(clk_out),.rst(rst),.D(input_dff[2]),.Q(output_dff[2]));
	D_Flip_Flop dff4(.clk(clk_out),.rst(rst),.D(input_dff[3]),.Q(output_dff[3]));
	add_by_one_adder adder(.A(output_dff),.S(input_dff));
	assign out=output_dff;
endmodule
