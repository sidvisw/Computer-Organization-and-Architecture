`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:37:19 11/08/2022
// Design Name:   InstrMem
// Module Name:   /home/sidharth/Downloads/KGP_miniRISC/InstrMem_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstrMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstrMem_test;

	// Inputs
	reg clka;
	reg [9:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	InstrMem uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;
	end
	
	always #10 clka = ~clka;
	
	initial begin
		#100;

		@(posedge clka)
		addra = 10'd0;
		
		#20; addra = 10'd0;
		#20; addra = 10'd1;
	end
      
endmodule

