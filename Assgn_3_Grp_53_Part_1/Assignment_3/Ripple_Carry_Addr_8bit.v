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

module Ripple_Carry_Addr_8bit(A, B, cin, S, cout);
    input[7:0] A, B;		// Inputs
    input cin;				// Input
    output[7:0] S;		// Output
    output cout;			// Output

    wire c1, c2, c3, c4, c5, c6, c7;	//Wires
    // 8 instantiated 1-bit full adders
    full_addr fa0 (.a(A[0]), .b(B[0]), .cin(cin), .cout(c1), .sum(S[0]));
    full_addr fa1 (.a(A[1]), .b(B[1]), .cin(c1), .cout(c2), .sum(S[1]));
    full_addr fa2 (.a(A[2]), .b(B[2]), .cin(c2), .cout(c3), .sum(S[2]));
    full_addr fa3 (.a(A[3]), .b(B[3]), .cin(c3), .cout(c4), .sum(S[3]));
	 full_addr fa4 (.a(A[4]), .b(B[4]), .cin(c4), .cout(c5), .sum(S[4]));
	 full_addr fa5 (.a(A[5]), .b(B[5]), .cin(c5), .cout(c6), .sum(S[5]));
	 full_addr fa6 (.a(A[6]), .b(B[6]), .cin(c6), .cout(c7), .sum(S[6]));
	 full_addr fa7 (.a(A[7]), .b(B[7]), .cin(c7), .cout(cout), .sum(S[7]));
endmodule