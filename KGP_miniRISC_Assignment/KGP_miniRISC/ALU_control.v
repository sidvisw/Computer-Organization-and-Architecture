`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:48:21 10/28/2022 
// Design Name: 
// Module Name:    ALU_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_control(OPcode, Funcode, ALUcode);
    input [5:0] OPcode;
    input [5:0] Funcode;
    output reg [3:0] ALUcode;

    always @(*) begin
        if (OPcode[5] == 1)
		    ALUcode = 4'b0;
        else if (OPcode == 6'b0)
		    ALUcode = Funcode[3:0];
        else if (OPcode == 6'b001000 || OPcode[5:4] == 2'b01)
		    ALUcode = 4'b0001;
		  else if (OPcode == 6'b001001)
		    ALUcode = 4'b0101;
        else 
            ALUcode = 4'b0000;
    end
endmodule
