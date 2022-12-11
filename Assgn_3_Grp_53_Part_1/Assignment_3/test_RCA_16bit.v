`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:56:25 08/25/2022
// Design Name:   Ripple_Carry_Addr_16bit
// Module Name:   /home/umang/Assignment_3/test_RCA_16bit.v
// Project Name:  Assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ripple_Carry_Addr_16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_RCA_16bit;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg cin;

	// Outputs
	wire [15:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Ripple_Carry_Addr_16bit uut (
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

