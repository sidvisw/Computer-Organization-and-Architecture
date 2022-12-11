`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:00 10/21/2022 
// Design Name: 
// Module Name:    shifter 
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
module shifter(A, shamt, drxn, type, out);
	 input signed [31:0] A;         // input
    input [4:0] shamt;      // input
    input drxn;             // input 0->left, 1->right
    input type;             // input 0->logical, 1->arithmetic
    output reg [31:0] out;

    always @(*) begin
        if (type) begin
            if (!drxn) begin
                out = A;
            end
            else begin
                out = A >>> shamt;  // arithmetic right shift
            end
        end
        else begin
            if (!drxn) begin
                out = A << shamt;   // logical left shift
            end
            else begin
                out = A >> shamt;   // logical right shift
            end
        end
    end
endmodule
