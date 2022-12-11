`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:59:45 08/25/2022
// Design Name:   Ripple_Carry_Addr_32bit
// Module Name:   /home/umang/Assignment_3/test_RCA_32bit.v
// Project Name:  Assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ripple_Carry_Addr_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_RCA_32bit;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg cin;

	// Outputs
	wire [31:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Ripple_Carry_Addr_32bit uut (
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
		A=32'd1024;
		B=32'd4096;
		#16;
		
		A=32'd34343434;
		B=32'd8123659;
		#16;
		
		A=32'd294967295;
		B=32'd8123659;
		#16;
		
		$finish;
	end
      
endmodule

