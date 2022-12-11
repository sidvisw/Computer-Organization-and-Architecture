`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:26 09/14/2022 
// Design Name: 
// Module Name:    clock_divider 
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
module clock_divider(clk_in,clk_out);
	input clk_in; // input clock on FPGA
	output reg clk_out; // output clock after dividing the input clock by divisor
	reg[31:0] counter=32'd0;
	parameter DIVISOR = 32'd100000000;
	// The frequency of the output clk_out
	//  = The frequency of the input clk_in divided by DIVISOR
	// For example: Fclk_in = 100Mhz, if you want to get 20Hz signal to blink LEDs
	// You will modify the DIVISOR parameter value to 28'd5000000
	// Then the frequency of the output clk_out = 100Mhz / 5000000 = 1Hz
	always @(posedge clk_in)
	begin
		counter <= counter + 32'd1;
		if(counter>=(DIVISOR-1))
			counter <= 32'd0;
		clk_out <= (counter<DIVISOR/2)?1'b1:1'b0;
	end
endmodule
