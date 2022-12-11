`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:25 10/27/2022 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter(in, clk, rst, out);
    input [31:0] in;
    input clk, rst;
    output reg [31:0] out;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= -4;
        end 
        else begin
            out <= in;
        end
    end
endmodule
