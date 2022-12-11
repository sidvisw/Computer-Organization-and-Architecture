`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:45 08/30/2022
// Design Name:   CLA_16bit
// Module Name:   /home/siddharth/Desktop/COA/Assignment3_CLA/test_16bit_CLA.v
// Project Name:  Assignment3_CLA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_16bit_CLA;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg cin;

	// Outputs
	wire [15:0] S;
	wire [3:0] P;
	wire [3:0] G;

	// Instantiate the Unit Under Test (UUT)
	CLA_16bit uut (
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
		$monitor("A = %d B = %d S = %d",A,B,S);
		
		// Add stimulus here
		A=16'd414;
		B=16'd1036;
		#16;
		
		A=16'd5045;
		B=16'd45042;
		#16;
		
		A=16'd32768;
		B=16'd32768;
		#16;
		
		A=16'd65535;
		B=16'd65535;
		#16;
		
		$finish;
	end
      
endmodule

