`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:19 10/28/2022 
// Design Name: 
// Module Name:    branch_control 
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
module branch_control(OPcode, fzero, fsign, fcarry, out);
   input [5:0] OPcode;
   input fzero, fsign, fcarry;
   output out;

   wire b, bZero, bNZero, bSign, bCarry, bNCarry;
	 
	assign b = (OPcode == 6'b101011) |(OPcode == 6'b101000) | (OPcode == 6'b100000); 
	assign bZero = (OPcode == 6'b110001) & fzero;
	assign bNZero = (OPcode == 6'b110010) & ~fzero;
	assign bSign = (OPcode == 6'b110000) & fsign;
	assign bCarry = (OPcode == 6'b101001) & fcarry;
	assign bNCarry = (OPcode == 6'b101010) & ~fcarry;
	
	assign out = b | bZero | bNZero | bSign | bCarry | bNCarry;
endmodule
