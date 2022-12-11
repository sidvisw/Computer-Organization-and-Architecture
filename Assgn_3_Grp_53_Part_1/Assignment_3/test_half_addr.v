`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:06:50 08/25/2022
// Design Name:   half_addr
// Module Name:   /home/umang/Assignment_3/test_half_addr.v
// Project Name:  Assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: half_addr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_half_addr;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire cout;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	half_addr uut (
		.a(a), 
		.b(b), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Monitor the changes
		$monitor("A=%b\tB=%b\tSum=%b\tC_out=%b",a,b,sum,cout);
        
		// Add stimulus here
		a=1'b0;
		b=1'b0;
		#16
		
		a=1'b0;
		b=1'b1;
		#16;
		
		a=1'b1;
		b=1'b0;
		#16;
		
		a=1'b1;
		b=1'b1;
		#16;
		
		$finish;
	end
      
endmodule

