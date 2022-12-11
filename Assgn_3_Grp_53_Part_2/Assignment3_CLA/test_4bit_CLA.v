`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:03:01 08/30/2022
// Design Name:   CLA_4bit
// Module Name:   /home/siddharth/Desktop/COA/Assignment3_CLA/test_4bit_CLA.v
// Project Name:  Assignment3_CLA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_4bit_CLA;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg cin;

	// Outputs
	wire [3:0] S;
	wire P;
	wire G;

	// Instantiate the Unit Under Test (UUT)
	CLA_4bit uut (
		.A(A), 
		.B(B), 
		.cin(cin), 
		.S(S), 
		.P(P), 
		.G(G)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Monitor the changes
		$monitor("A = %d\tB = %d\tS = %d", A, B, S);
		
		// Add stimulus here
		A = 11;
		B = 3;
		#16;
		
		A = 8;
		B = 8;
		#16;
		
		A = 9;
		B = 0;
		#16;
		
		A = 10;
		B = 5;
		#16;
		
		$finish;
	end
      
endmodule

