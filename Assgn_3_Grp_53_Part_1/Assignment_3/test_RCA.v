`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:19:08 08/25/2022
// Design Name:   Ripple_Carry_Addr_64bit
// Module Name:   /home/umang/Assignment_3/test_RCA.v
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

module test_RCA;

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
      
		// Add stimulus here
		A=100;
		B=24;
		#16
		$display("%d + %d = %d",A,B,S);
		A=34;
		B=57;
		#16
		$display("%d + %d = %d",A,B,S);
		A=98;
		B=40;
		#16
		$display("%d + %d = %d",A,B,S);
		$finish;
	end
      
endmodule

