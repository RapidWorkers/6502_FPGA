/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

/*
	6502 has 6 registers
		Type (bit-width)
	1. Accumulator (8)
	2. Index X (8)
	3. Index Y (8)
	4. Stack Pointer (8'b0000_0001 + 8bit register)
	5. Program Counter (16) -- need independent increment logic
	6. Status Register (8)
	
*/

module REG_FILE(
	input clk1,
	input clk2,
	input RDY,
	input rst,
	input ACC_EN,
	input IDX_EN,
	input IDY_EN,
	input SP_EN,
	input PC_EN,
	input SR_EN,
	input [7:0] ACC_D,
	input [7:0] IDX_D,
	input [7:0] IDY_D,
	input [7:0] SP_D,
	input [7:0] PC_D,
	input [7:0] SR_D,
	output [7:0] ACC_Q,
	output [7:0] IDX_Q,
	output [7:0] IDY_Q,
	output [15:0] SP_Q,
	output [7:0] PC_Q,
	output [7:0] SR_Q
	
);

	//accumulator
	REG_EN_8bit U0_Reg_Acc(clk2, rst, ACC_EN, ACC_D, ACC_Q);
	
	//index x
	REG_EN_8bit U1_Reg_IDX(clk2, rst, IDX_EN, IDX_D, IDX_Q);
	
	//index y
	REG_EN_8bit U2_Reg_IDY(clk2, rst, IDY_EN, IDY_D, IDY_Q);
	
	//stack pointer
	REG_EN_8bit U3_Reg_SP(clk2, rst, SP_EN, SP_D, SP_Q[7:0]);
	assign SP_Q[15:8] = 8'b0000_0001; //hard wired
	
	//program counter
	reg [7:0] PC_INPUT;
	always @(PC_EN or PC_Q or PC_D) begin
		if(PC_EN) PC_INPUT <= PC_D;//enabled => jump, branch, etc...
		else PC_INPUT <= PC_Q[7:0]+1'b1;//disabled => auto increment
	end
	REG_EN_8bit U4_Reg_PC(clk2, rst, PC_EN, PC_INPUT, PC_Q);
	
	//status register
	//format: NV-BDIZC
	REG_EN_8bit U5_Reg_SR(clk2, rst, SR_EN, SR_D, SR_Q);
	
endmodule
