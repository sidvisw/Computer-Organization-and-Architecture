`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:45 11/09/2022 
// Design Name: 
// Module Name:    debounce 
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
module debounce(input pb_1,clk,output pb_out);
wire slow_clk;
wire Q1,Q2,Q2_bar,Q0;
clock_div u1(clk,slow_clk);
d_flip_flop d0(slow_clk, pb_1,Q0 );

d_flip_flop d1(slow_clk, Q0,Q1 );
d_flip_flop d2(slow_clk, Q1,Q2 );
assign Q2_bar = ~Q2;
assign pb_out = Q1 & Q2_bar;
endmodule
