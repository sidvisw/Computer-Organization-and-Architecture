`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:25 09/14/2022 
// Design Name: 
// Module Name:    D_Flip_Flop 
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
module D_Flip_Flop(clk, rst, D, Q);
	 input clk, rst, D;            // inputs
    output reg Q;                  // outputs
    
	 always @ (posedge clk or posedge rst)
		if(rst)
			Q <= 0;
		else
			Q <= D;
endmodule
