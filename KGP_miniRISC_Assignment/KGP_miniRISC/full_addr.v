`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:36 10/21/2022 
// Design Name: 
// Module Name:    full_addr 
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
module full_addr(a, b, cin, cout, sum);
    input  a, b, cin;      // inputs
    output cout, sum;      // outputs
    wire   w1, w2, w3, w4; // internal nets
	 
	// Instantiating two half adders
	half_addr ha1(.a(a),.b(b),.cout(w1),.sum(w2));
	half_addr ha2(.a(w2),.b(cin),.cout(w3),.sum(sum));
    or  U1  (cout, w1, w3);
endmodule
