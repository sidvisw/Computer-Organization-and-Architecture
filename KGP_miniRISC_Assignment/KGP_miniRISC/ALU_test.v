`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:54:04 11/04/2022
// Design Name:   ALU
// Module Name:   /home/sidharth/Desktop/COA/KGP_miniRISC/ALU_test.v
// Project Name:  KGP_miniRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [3:0] ALUcode;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] result;
	wire fzero;
	wire fsign;
	wire fcarry;
	wire fequal;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALUcode(ALUcode), 
		.shamt(shamt), 
		.result(result), 
		.fzero(fzero), 
		.fsign(fsign), 
		.fcarry(fcarry), 
		.fequal(fequal)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALUcode = 0;
		shamt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 32'd12; ALUcode = 4'b0000; #20;												// forward
		
		A = 32'd12; B = 32'd11; ALUcode = 4'b0001; #20;								// add
		B = 32'd11; ALUcode = 4'b0101; #20;												// complement
		
		A = 32'd15; B = 32'd8; ALUcode = 4'b0011; #20								// xor
		A = 32'd15; B = 32'd8; ALUcode = 4'b0010; #20								// and
		
		A = 32'd172; B = 32'd124; ALUcode = 4'b0100; #20							//diff
		
		A = 32'd4; ALUcode = 4'b1100; shamt = 5'd2; #20;									// shift-left-logical by 2 bits
      A = 32'd8; ALUcode = 4'b1110; shamt = 5'd2; #20;									// shift-right-logical by 2 bits
		A = 32'd4; ALUcode = 4'b1000; shamt = 5'd16; B = 32'd2; #20;					// shift-left-variable by 2 bits
		A = -32'd2147483648; ALUcode = 4'b1010; shamt = 5'd16; B = 32'd2; #20;		// shift-right-logical-variable by 2 bits
		A = 32'd8; ALUcode = 4'b1111; shamt = 5'd2;  B = 32'd50; #20;					// shift-right-arithmatic by 2 bits
		A = -32'd2147483648; ALUcode = 4'b1011; shamt = 5'd16;  B = 32'd2; #20;		// shift-right-arithmatic-variable by 2 bits
	end
      
endmodule

