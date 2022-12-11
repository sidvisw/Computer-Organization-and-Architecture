`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:09 10/21/2022 
// Design Name: 
// Module Name:    mux_3x1 
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
module mux_3x1(input0, input1, input2, select, out);
    input [31:0] input0, input1, input2;
    input [1:0] select;
    output reg [31:0] out;

    always @(*) begin
        case (select)
            2'b00 : out = input0;
            2'b01 : out = input1;
            2'b10 : out = input2;
            default : out = 32'b0;
        endcase
    end
endmodule
