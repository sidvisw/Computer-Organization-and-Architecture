`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:16:08 09/14/2022
// Design Name:   counter_4_bit
// Module Name:   /home/siddharth/Desktop/COA/Assgn_5_Grp_53/test_counter_4_bit.v
// Project Name:  Assgn_5_Grp_53
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter_4_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_counter_4_bit;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	counter_4_bit uut (
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

