`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:35:13 11/04/2022
// Design Name:   shifter
// Module Name:   /home/sidharth/Desktop/COA/KGP_miniRISC/shifter_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shifter_test;

	// Inputs
	reg [31:0] A;
	reg [4:0] shamt;
	reg drxn;
	reg type;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	shifter uut (
		.A(A), 
		.shamt(shamt), 
		.drxn(drxn), 
		.type(type), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		shamt = 0;
		drxn = 0;
		type = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		drxn = 1;
		type = 0;
		A = 32'd2147483648;
		shamt = 5'd3;
		#100;
		
		drxn = 0;
		type = 0;
		#100;
		
		drxn = 1;
		type = 1;
		#100;
		
		drxn = 0;
		type = 1;
		#100;
	end
      
endmodule

