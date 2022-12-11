`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:10:50 08/25/2022 
// Design Name: 
// Module Name:    Ripple_Carry_Addr_64bit 
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
module Ripple_Carry_Addr_64bit(A, B, cin, S, cout);
    input[63:0] A, B;
    input cin;
    output[63:0] S;
    output cout;

    wire temp_cout;
    // 2 instantiated 8-bit ripple carry adders
    Ripple_Carry_Addr_32bit rca_32bit_1(.A(A[31:0]),.B(B[31:0]),.cin(cin),.S(S[31:0]),.cout(temp_cout));
	 Ripple_Carry_Addr_32bit rca_32bit_2(.A(A[63:32]),.B(B[63:32]),.cin(temp_cout),.S(S[63:32]),.cout(cout));
endmodule