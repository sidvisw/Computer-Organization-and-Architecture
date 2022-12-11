`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:47 10/28/2022
// Design Name:   diff
// Module Name:   /home/sidharth/Desktop/COA/KGP_miniRISC/diff_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: diff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module diff_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [4:0] out;
	wire eq;

	// Instantiate the Unit Under Test (UUT)
	diff uut (
		.A(A), 
		.B(B), 
		.out(out), 
		.eq(eq)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 126;
		B = 2;
		#100;
		
		A = 4;
		B = 12;
		#100;
	end
      
endmodule

