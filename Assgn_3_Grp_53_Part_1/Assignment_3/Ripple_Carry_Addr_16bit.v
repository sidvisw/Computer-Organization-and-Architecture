`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:16 08/25/2022 
// Design Name: 
// Module Name:    Ripple_Carry_Addr 
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

/*
   Assignment No. - 3
   Problem No. - 1
   Semester - 5 (Autumn 2022-23)
   Group No. - 53
   Group Members - Umang Singla (20CS10068) & Sidhharth Vishwakarma (20CS10082)
*/

module Ripple_Carry_Addr_16bit(A, B, cin, S, cout);
    input[15:0] A, B;	// Inputs
    input cin;				// Input
    output[15:0] S;		// Output
    output cout;			// Output

    wire temp_cout;		// Wire
    // 2 instantiated 8-bit ripple carry adders
    Ripple_Carry_Addr_8bit rca_8bit_1(.A(A[7:0]),.B(B[7:0]),.cin(cin),.S(S[7:0]),.cout(temp_cout));
	 Ripple_Carry_Addr_8bit rca_8bit_2(.A(A[15:8]),.B(B[15:8]),.cin(temp_cout),.S(S[15:8]),.cout(cout));
endmodule