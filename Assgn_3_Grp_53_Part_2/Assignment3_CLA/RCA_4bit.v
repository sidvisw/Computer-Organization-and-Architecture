`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:21 08/30/2022 
// Design Name: 
// Module Name:    RCA_4bit 
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
module RCA_4bit(A, B, cin, S, cout);
    input[3:0] A, B;
    input cin;
    output[3:0] S;
    output cout;

    wire c1, c2, c3;
    // 4 instantiated 1-bit full adders
    full_addr fa0 (A[0], B[0], cin, c1, S[0]);
    full_addr fa1 (A[1], B[1], c1, c2, S[1]);
    full_addr fa2 (A[2], B[2], c2, c3, S[2]);
    full_addr fa3 (A[3], B[3], c3, cout, S[3]);
endmodule
