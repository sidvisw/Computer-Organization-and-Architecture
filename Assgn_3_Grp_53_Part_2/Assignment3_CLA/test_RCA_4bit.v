`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:51:53 08/30/2022
// Design Name:   wrapper_RCA_4bit
// Module Name:   /home/siddharth/Desktop/COA/Assignment_3/Assignment3_CLA/test_RCA_4bit.v
// Project Name:  Assignment3_CLA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wrapper_RCA_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_RCA_4bit;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] in1;
	reg [3:0] in2;
	reg cin;

	// Outputs
	wire [3:0] out;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	wrapper_RCA_4bit uut (
		.clk(clk), 
		.rst(rst), 
		.in1(in1), 
		.in2(in2), 
		.cin(cin), 
		.out(out), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		clk <= 0;
		rst <= 0;
		in1 <= 0;
		in2 <= 0;
		cin <= 0;
	end
	
	always #10 clk=~clk;
	
	initial begin
		#100 rst <= 1'd0;
		in1<=4'd10;
		in2<=4'd5;
	end
      
endmodule

