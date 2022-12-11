`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:45 11/03/2022 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(OPcode, regWrite, memWrite, memRead, regDest, memToReg, ALUSrc, labelSel, jumpSel);
	input [5:0] OPcode;
	output regWrite, memWrite, memRead, ALUSrc, labelSel, jumpSel;
	output [1:0] regDest, memToReg;

	assign regWrite = (~OPcode[5] & ~OPcode[4]) | (~OPcode[5] & ~OPcode[3]) | (OPcode[1] & OPcode[0]);
	assign memWrite = (OPcode == 6'b011000);
	assign memRead = (OPcode == 6'b010000);
	assign ALUSrc = OPcode[4] | OPcode[3];
	assign labelSel = OPcode[5] & OPcode[4];
	assign jumpSel = ~OPcode[4] & ~OPcode[3];
	assign regDest = OPcode[5:4];
	assign memToReg = OPcode[5:4];
endmodule
