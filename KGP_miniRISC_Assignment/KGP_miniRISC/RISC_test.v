`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:19:29 11/09/2022
// Design Name:   RISC
// Module Name:   /home/sidharth/Desktop/COA/KGP_miniRISC/RISC_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RISC_test;

	// Inputs
	reg clk;
	reg rst;
	reg button;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	RISC uut (
		.clk(clk), 
		.rst(rst), 
		.button(button), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		button = 0;

		#1;
		rst = 1;
		#1;
		rst = 0;
		#3;
		#50000;
		$finish;
	end
	
	always @(*) begin
		if (uut.r_file.registerBank[1] == 1) begin
			$display("Content of return value register $v0: %d", uut.r_file.registerBank[2]);
			$finish;
		end
	end
	
	always
	#5 clk = ~clk;
      
endmodule

