`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:35:47 11/06/2022 
// Design Name: 
// Module Name:    mux_3x1_5bits 
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
module mux_3x1_5bits(input0, input1, input2, select, out);
	input [4:0] input0, input1, input2;
   input [1:0] select;
   output reg [4:0] out;
	 
	always @(*) begin
        case (select)
            2'b00 : out = input0;
            2'b01 : out = input1;
            2'b10 : out = input2;
            default : out = 32'b0;
        endcase
    end
endmodule
