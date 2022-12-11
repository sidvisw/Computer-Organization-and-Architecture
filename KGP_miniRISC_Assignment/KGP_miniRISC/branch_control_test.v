`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:16:29 11/08/2022
// Design Name:   branch_control
// Module Name:   /home/sidharth/Downloads/KGP_miniRISC/branch_control_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branch_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_control_test;

	// Inputs
	reg [5:0] OPcode;
	reg fzero;
	reg fsign;
	reg fcarry;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	branch_control uut (
		.OPcode(OPcode), 
		.fzero(fzero), 
		.fsign(fsign), 
		.fcarry(fcarry), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		OPcode = 0;
		fzero = 0;
		fsign = 0;
		fcarry = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		OPcode = 6'b101000; #10; // op:b
		OPcode = 6'b100000; #10; // op:br
		OPcode = 6'b110000; fsign = 1; #10; //op:bltz rs < 0
		OPcode = 6'b110000; fsign = 0; #10; //op:bltz rs >= 0
		OPcode = 6'b110001; fzero = 1; #10; //op:bz rs == 0
		OPcode = 6'b110001; fzero = 0; #10; //op:bz rs != 0
		OPcode = 6'b110010; fzero = 0; #10; //op:bnz rs != 0
		OPcode = 6'b110010; fzero = 1; #10; //op:bnz rs == 0
		OPcode = 6'b101011; #10;  //op:bl
		OPcode = 6'b101001; fcarry = 1; #10; //op:bcy carry = 1
		OPcode = 6'b101010; fcarry = 0; #10; //op:bncy carry = 0
		OPcode = 6'b000000; #10;
	end
      
endmodule

