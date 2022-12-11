`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:14:43 11/09/2022
// Design Name:   wrapper_RISC
// Module Name:   /home/sidharth/Desktop/COA/KGP_miniRISC/wrapper_RISC_fib_test.v
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

module wrapper_RISC_fib_test;

	// Inputs
	reg clk;
	reg rst;
	reg select;
	reg [9:0] inp;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	wrapper_RISC uut (
		.clk(clk), 
		.rst(rst),
		.select(select),
		.inp(inp), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		inp = 0;
		select = 0;
        
		// Add stimulus here
		#1;
		rst = 1;
		#1;
		rst = 0;
		#3;
		#6000000;
		#50 select = 1;
		#50 inp = 0;
		#50;
		$finish;
	end
	
	always #10 clk = ~clk;
      
endmodule

