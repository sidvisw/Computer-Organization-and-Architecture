`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:43:12 08/30/2022 
// Design Name: 
// Module Name:    RCA_16bit 
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
module RCA_16bit(A, B, cin, S, cout);
    input[15:0] A, B;	// Inputs
    input cin;				// Input
    output[15:0] S;		// Output
    output cout;			// Output

    wire [3:0] temp_cout;		// Wire
    // 2 instantiated 8-bit ripple carry adders
    RCA_4bit rca_4bit_0(.A(A[3:0]),.B(B[3:0]),.cin(cin),.S(S[3:0]),.cout(temp_cout[0]));
	 RCA_4bit rca_4bit_1(.A(A[7:4]),.B(B[7:4]),.cin(temp_cout[0]),.S(S[7:4]),.cout(temp_cout[1]));
	 RCA_4bit rca_4bit_2(.A(A[11:8]),.B(B[11:8]),.cin(temp_cout[1]),.S(S[11:8]),.cout(temp_cout[2]));
	 RCA_4bit rca_4bit_3(.A(A[15:12]),.B(B[15:12]),.cin(temp_cout[2]),.S(S[15:12]),.cout(cout));
endmodule
