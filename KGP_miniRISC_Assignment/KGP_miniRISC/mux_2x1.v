`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:11 10/21/2022 
// Design Name: 
// Module Name:    mux_2x1 
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
module mux_2x1(input0, input1, select, out);
    input [31:0] input0, input1;
    input select;
    output [31:0] out;

    assign out = select ? input1 : input0;
endmodule
