`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:02 11/04/2022 
// Design Name: 
// Module Name:    RISC 
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
module RISC(clk, rst, select, inp, out);
	input clk, rst, select;
	input [9:0] inp;
	output [31:0] out;

	// instruction address and current instruction
	wire [31:0] next_Instr_addr, instr_addr, instruction;

	// flags from ALU
	wire fzero, fsign, fcarry, fequal;

	// outputs from Control Unit
	wire regWrite, memWrite, memRead, ALUSrc, labelSel, jumpSel;
	wire [1:0] regDest, memToReg;

	// program counter
	program_counter pc(.in(next_Instr_addr), .clk(clk), .rst(rst), .out(instr_addr));	// program counter

	/* instruction_memory module here */
	InstrMem IM (
	  .clka(clk), // input clka
	  .addra({2'b0,next_Instr_addr[9:2]}), // input [9 : 0] addra
	  .douta(instruction) // output [31 : 0] douta
	);
	

	// instruction decode
	wire [5:0] OPcode, Funcode;
	wire [4:0] rs, rt, shamt;
	wire [15:0] immediate;
	assign OPcode = instruction[31:26];
	assign rs = instruction[25:21];
	assign rt = instruction[20:16];
	assign immediate = instruction[15:0];
	assign Funcode = instruction[10:5];
	assign shamt = instruction[15:11];

	// register-file registers
	wire [4:0] writeReg, ra;
	wire [31:0] writeData, readData1, readData2;
	assign ra = 5'b11111;

	// 3x1 MUX for choosing between rs, rt and ra
	mux_3x1_5bits mux_regDest(.input0(rs), .input1(rt), .input2(ra), .select(regDest), .out(writeReg));

	// register file module
	register_file r_file(.rs(rs), .rt(rt), .regWrite(regWrite), .writeReg(writeReg), .writeData(writeData), .clk(clk), .rst(rst), .readData1(readData1), .readData2(readData2));

	// control unit module
	control_unit ctrl_u(.OPcode(OPcode), .regWrite(regWrite), .memWrite(memWrite), .memRead(memRead), .regDest(regDest), .memToReg(memToReg), .ALUSrc(ALUSrc), .labelSel(labelSel), .jumpSel(jumpSel));

	wire [3:0] ALUcode;	// ALU code for input to ALU

	// ALU control module
	ALU_control alu_ctrl(.OPcode(OPcode), .Funcode(Funcode), .ALUcode(ALUcode));

	wire [31:0] extend_immediate;	// wire to store the sign extended immediate value

	// sign extension module
	sign_extend sgn_ext(.inp(immediate), .out(extend_immediate));

	wire [31:0] ALUInput2;	// second input of ALU
	mux_2x1 mux_alu(.input0(readData2), .input1(extend_immediate), .select(ALUSrc), .out(ALUInput2));
	
	wire [31:0] ALU_result;	// ALU result

	// ALU module
	ALU alu(.A(readData1), .B(ALUInput2), .ALUcode(ALUcode), .shamt(shamt), .result(ALU_result), .fzero(fzero), .fsign(fsign), .fcarry(fcarry), .fequal(fequal));

	wire carry_out;	// wire to store the carry out

	// d flip flop module
	d_flip_flop dff(.clk(clk), .rst(rst), .inp(fcarry), .out(carry_out));

	wire fbranch;	// flag for branching

	// branch control module
	branch_control br_ctrl(.OPcode(OPcode), .fzero(fzero), .fsign(fsign), .fcarry(carry_out), .out(fbranch));

	wire enable;	// enable is set to 1 when mem
	wire [31:0] memData;	// data read from the memory
	assign enable = memRead | memWrite | select;
	
	wire [9:0] addr_to_mem;
	assign addr_to_mem = select ? inp : {2'b00, ALU_result[9:2]};

	/* data memory module here */
	DataMem dataMem (
	  .clka(~clk), // input clka
	  .ena(enable), // input ena
	  .wea(memWrite), // input [0 : 0] wea
	  .addra(addr_to_mem), // input [9 : 0] addra
	  .dina(readData2), // input [31 : 0] dina
	  .douta(memData) // output [31 : 0] douta
	);
	
	assign out = memData[15:0];
	
	wire [31:0] pc_add4, jumplabel, jump_immediatelabel;	// wires to store the next location to execute

	// program counter logic
	assign pc_add4 = instr_addr + 4;	// jump to next instruction
	assign jumplabel = {pc_add4[31:28], {instruction[25:0], 2'b00}};	// pseudo-direct jump
	assign jump_immediatelabel = pc_add4 + {extend_immediate[29:0], 2'b00};	// program counter relative jump

	wire [31:0] labelSel_out, jumpSel_out;	// wires to mark the output of branch MUXs

	mux_2x1 mux_labelSel(.input0(jumplabel), .input1(jump_immediatelabel), .select(labelSel), .out(labelSel_out));
	mux_2x1 mux_jumpSel(.input0(labelSel_out), .input1(readData1), .select(jumpSel), .out(jumpSel_out));
	mux_2x1 mux_branchSel(.input0(pc_add4), .input1(jumpSel_out), .select(fbranch), .out(next_Instr_addr));

	mux_3x1 mux_memToReg(.input0(ALU_result), .input1(memData), .input2(pc_add4), .select(memToReg), .out(writeData));
endmodule
