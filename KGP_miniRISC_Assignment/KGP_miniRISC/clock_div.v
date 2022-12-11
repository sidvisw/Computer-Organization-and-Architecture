`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:46 11/09/2022 
// Design Name: 
// Module Name:    clock_div 
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
// Slow clock for debouncing 
module clock_div(input Clk_100M, output reg slow_clk);
    reg [26:0]counter=0;
    always @(posedge Clk_100M)
    begin
        counter <= (counter>=249999)?0:counter+1;
        slow_clk <= (counter < 125000)?1'b0:1'b1;
    end
endmodule
