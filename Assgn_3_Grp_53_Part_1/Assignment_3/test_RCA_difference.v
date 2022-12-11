`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:39:38 08/26/2022
// Design Name:   Ripple_Carry_Addr_64bit
// Module Name:   /home/umang/Assignment_3/test_RCA_difference.v
// Project Name:  Assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ripple_Carry_Addr_64bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_RCA_difference;

	// Inputs
	reg [63:0] A;
	reg [63:0] B;
	reg cin;

	// Outputs
	wire [63:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Ripple_Carry_Addr_64bit uut (
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
		$monitor("A = %d ~B = %d S = %d",A,B,S);
        
		// Add stimulus here
		A=64'd946473974;
		B=64'd48390047;
		B=~B;
		cin=1'b1;
		#16;
		
		A=64'd150000000000000000;
		B=64'd100000000000000000;
		B=~B;
		cin=1'b1;
		#16;
		
		A=64'd9223372036854775807;
		B=64'd9223372036854775807;
		B=~B;
		cin=1'b1;
		#16;
		
		$finish;
	end
      
endmodule

