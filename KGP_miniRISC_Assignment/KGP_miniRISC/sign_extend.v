`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:16 10/21/2022 
// Design Name: 
// Module Name:    sign_extend 
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
module sign_extend(inp, out);
    input [15:0] inp;
    output [31:0] out;

    assign out = {{16{inp[15]}}, inp};
endmodule
