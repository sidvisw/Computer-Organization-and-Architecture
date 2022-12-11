`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:32:11 11/04/2022
// Design Name:   adder
// Module Name:   /home/sidharth/Desktop/COA/KGP_miniRISC/adder_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg cin;

	// Outputs
	wire [31:0] S;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.A(A), 
		.B(B), 
		.cin(cin), 
		.S(S), 
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 32'd2147483648;
		B = 32'd1073741824;
		#10;
	end
      
endmodule

