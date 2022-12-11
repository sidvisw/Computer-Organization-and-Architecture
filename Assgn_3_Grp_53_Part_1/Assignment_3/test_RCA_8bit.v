`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:30:50 08/25/2022
// Design Name:   Ripple_Carry_Addr_8bit
// Module Name:   /home/umang/Assignment_3/test_RCA_8bit.v
// Project Name:  Assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ripple_Carry_Addr_8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_RCA_8bit;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg cin;

	// Outputs
	wire [7:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Ripple_Carry_Addr_8bit uut (
		.A(A), 
		.B(B), 
		.cin(cin), 
		.S(S), 
		.cout(cout)
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
		A=8'd42;
		B=8'd45;
		#16;
		
		A=8'd128;
		B=8'd127;
		#16;
		
		A=8'd130;
		B=8'd169;
		#16;
		
		A=8'd255;
		B=8'd255;
		#16;
		
		$finish;
	end
      
endmodule

