`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:13 08/30/2022 
// Design Name: 
// Module Name:    wrapper_CLA_16_bit 
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
module wrapper_CLA_16bit(input clk, input rst, input [15:0] in1, input [15:0] in2, input cin, output reg [15:0] out, output reg P, output reg G);

reg [15:0] in1_reg;
reg [15:0] in2_reg;
reg c_in;
wire [15:0] out_net;
wire p_net,g_net;
always @(posedge clk)
    begin
        if(rst)
            begin
                in1_reg<=16'd0;
                in2_reg<=16'd0;
					 c_in<=1'b0;
					 out<=16'd0;
					 P<=1'b0;
					 G<=1'b0;
            end
        else
            begin
                in1_reg<=in1;
                in2_reg<=in2;
					 c_in<=cin;
					 out<=out_net;
					 P<=p_net;
					 G<=g_net;
            end
    end

CLA_16bit cla_16bit(in1_reg,in2_reg,c_in,out_net,p_net,g_net);

endmodule
