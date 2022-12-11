`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:51:00 11/09/2022
// Design Name:   wrapper_RISC
// Module Name:   /home/sidharth/Desktop/COA/KGP_miniRISC/wrapper_RISC_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wrapper_RISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wrapper_RISC_test;

	// Inputs
	reg clk;
	reg rst;
	reg button;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	wrapper_RISC uut (
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
        
		// Add stimulus here
		#1;
		rst = 1;
		#1;
		rst = 0;
		#3;
		#50000;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		#50 button = 1;
		#50 button = 0;
		$finish;
	end
	
	always #10 clk = ~clk;
      
endmodule

