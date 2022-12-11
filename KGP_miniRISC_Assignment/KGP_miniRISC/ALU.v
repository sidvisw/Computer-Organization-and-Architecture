`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:47 10/27/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(A, B, ALUcode, shamt, result, fzero, fsign, fcarry, fequal);
    input [31:0] A, B;
    input [3:0] ALUcode;
    input [4:0] shamt;
    output reg [31:0] result;
    output fzero, fsign, fcarry, fequal;

    wire [31:0] A_result, adder_result, and_result, xor_result, shifter_result, diff_result;
    wire [31:0] select_A, select_B;
    wire [4:0] shift_amount, diff_out_net;

    assign select_B = ALUcode[2] ? ~B : B;
    assign select_A = ALUcode[2] ? 32'd1 : A;

    assign shift_amount = ALUcode[2] ? shamt : B[4:0];

    assign A_result  = A;
    adder adder_1(.A(select_A), .B(select_B), .cin(1'b0), .S(adder_result), .carry(fcarry));
    assign and_result = A & B;
    assign xor_result = A ^ B;
    shifter shifter_1(.A(A), .shamt(shift_amount), .drxn(ALUcode[1]), .type(ALUcode[0]), .out(shifter_result));
    diff diff_1(.A(A), .B(B), .out(diff_out_net), .eq(fequal));
	 assign diff_result = {{27{1'b0}}, diff_out_net};
    
    always @(*) begin
        if (ALUcode[3])
            result = shifter_result;
        else if (ALUcode == 4'b0010)
            result = and_result;
        else if (ALUcode == 4'b0011)
            result = xor_result;
        else if (ALUcode == 4'b0001)
            result = adder_result;
        else if (ALUcode == 4'b0101)
            result = adder_result;
        else if (ALUcode == 4'b0100)
            result = diff_result;
        else
            result = A_result;
    end

    assign fzero = result == 32'd0;
    assign fsign = result[31];
endmodule
