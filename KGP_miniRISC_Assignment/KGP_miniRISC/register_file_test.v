`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:38:52 11/04/2022
// Design Name:   register_file
// Module Name:   /home/sidharth/Desktop/COA/KGP_miniRISC/register_file_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_file_test;

	// Inputs
	reg [4:0] rs;
	reg [4:0] rt;
	reg regWrite;
	reg [4:0] writeReg;
	reg [31:0] writeData;
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] readData1;
	wire [31:0] readData2;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.rs(rs), 
		.rt(rt), 
		.regWrite(regWrite), 
		.writeReg(writeReg), 
		.writeData(writeData), 
		.clk(clk), 
		.rst(rst), 
		.readData1(readData1), 
		.readData2(readData2)
	);

	initial begin
		// Initialize Inputs
		rs = 0;
		rt = 0;
		regWrite = 0;
		writeReg = 0;
		writeData = 0;
		clk = 0;
		rst = 0;
	end
	
	always #10 clk = ~clk;
	
	initial begin
		#10;
		rst = 1;
		#10;
		rst = 0;
		
		#20 regWrite = 1;
		writeReg = 5'd1;
		writeData = 32'd68;
		// regWrite = 0;
		
		#20 regWrite = 1;
		writeReg = 5'd2;
		writeData = 32'd82;
		
		#20;
		regWrite = 0;
		rs = 5'd1;
		rt = 5'd2;
	end
      
endmodule

