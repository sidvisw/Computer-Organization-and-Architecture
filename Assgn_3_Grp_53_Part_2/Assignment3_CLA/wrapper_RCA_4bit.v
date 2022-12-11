`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:47:08 08/30/2022 
// Design Name: 
// Module Name:    wrapper_RCA_4bit 
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
module wrapper_RCA_4bit(input clk, input rst, input [3:0] in1, input [3:0] in2, input cin, output reg [3:0] out, output reg cout);

reg [3:0] in1_reg;
reg [3:0] in2_reg;
reg c_in;
wire [3:0] out_net;
wire cout_net;
always @(posedge clk)
    begin
        if(rst)
            begin
                in1_reg<=4'd0;
                in2_reg<=4'd0;
					 c_in<=1'b0;
					 out<=4'd0;
					 cout<=1'b0;
            end
        else
            begin
                in1_reg<=in1;
                in2_reg<=in2;
					 c_in<=cin;
					 out<=out_net;
					 cout<=cout_net;
            end
    end

RCA_4bit rca_4bit(in1_reg,in2_reg,c_in,out_net,cout_net);

endmodule
