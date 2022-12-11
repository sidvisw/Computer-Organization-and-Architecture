`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:34:42 09/14/2022
// Design Name:   counter_4_bit_structural
// Module Name:   /home/siddharth/Desktop/COA/Assgn_5_Grp_53/test_counter_4_bit_structural.v
// Project Name:  Assgn_5_Grp_53
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter_4_bit_structural
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_counter_4_bit_structural;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	counter_4_bit_structural uut (
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);

	initial
		 begin
			  clk<=1'd0;
			  rst<=1'd0;
		 end
		 
	always #5 clk=~clk;
	
	initial
		begin
			#100 rst<=1'd1;
			#100 rst<=1'd0;
			#300000000 rst<=1'd1;
			#100 rst<=1'd0;
		end
      
endmodule

