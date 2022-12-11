`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:34 08/25/2022 
// Design Name: 
// Module Name:    Ripple_Carry_Addr_32bit 
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
module Ripple_Carry_Addr_32bit(A, B, cin, S, cout);
    input[31:0] A, B;	// Inputs
    input cin;				// Input
    output[31:0] S;		// Output
    output cout;			// Output

    wire temp_cout;		// Wire
    // 2 instantiated 16-bit ripple carry adders
    Ripple_Carry_Addr_16bit rca_16bit_1(.A(A[15:0]),.B(B[15:0]),.cin(cin),.S(S[15:0]),.cout(temp_cout));
	 Ripple_Carry_Addr_16bit rca_16bit_2(.A(A[31:16]),.B(B[31:16]),.cin(temp_cout),.S(S[31:16]),.cout(cout));
endmodule
