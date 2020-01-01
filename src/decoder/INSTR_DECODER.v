/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

module INSTR_DECODER(
	input [7:0] INSTR,	//instruction
	output SUMS,//SUM Flag
	output ANDS,//AND Flag
	output ORS,//OR Flag
	output EORS,//Exclusive OR Flag
	output SRS,//Shift Right Flag
	output DEC_En,//Enable Decimal Mode Flag
	output C_En,
	output Z_En,
	output I_En,
	output D_En,
	output B_En,
	output V_En,
	output N_En
);
	/*
		opCode Definition
		
		6502 Instruction Format
		AAABBBCC
		
		AAA = opCode
		BBB = Addressing Type
		CC = opCode
	*/
	
	//opCode with CC = 01
	localparam ORA = 3'b000;
	localparam AND = 3'b001;
	localparam EOR = 3'b010;
	localparam ADC = 3'b011;
	localparam STA = 3'b100;
	localparam LDA = 3'b101;
	localparam CMP = 3'b110;
	localparam SBC = 3'b111;	
	
	//opCode with CC = 10
	localparam ASL = 3'b000;
	localparam ROL = 3'b001;
	localparam LSR = 3'b010;
	localparam ROR = 3'b011;
	localparam STX = 3'b100;
	localparam LDX = 3'b101;
	localparam DEC = 3'b110;
	localparam INC = 3'b111;
		
	//opCode with CC = 00
	localparam BIT = 3'b001;
	localparam JMP = 3'b010;
	localparam JMPABS = 3'b011;
	localparam STY = 3'b100;
	localparam LDY = 3'b101;
	localparam CPY = 3'b110;
	localparam CPX = 3'b111;
	
	//Addressing Type
	localparam IM = 3'b000;//immediate
	localparam ZP = 3'b001;//zero page
	localparam AC = 3'b010;//accumulator
	localparam AB = 3'b011;//absolute
	localparam ZPY = 3'b100;//zero page, y
	localparam ZPX = 3'b101;//zero page, x
	localparam ABY = 3'b110;//absolute, y
	localparam ABX = 3'b111;//absolute, x
	
	
	//Single-byte Instructions
	
	//Branch Instructions
	localparam BPL = 8'h10;
	localparam BMI = 8'h30;
	localparam BVC = 8'h50;
	localparam BVS = 8'h70;
	localparam BCC = 8'h90;
	localparam BCS = 8'hB0;
	localparam BNE = 8'hD0;
	localparam BEQ = 8'hF0;
	
	//Interrupt and Subroutine
	localparam BRK = 8'h00;
	localparam JSRABS = 8'h20;
	localparam RTI = 8'h40;
	localparam RTS = 8'h60;
	
	//ETC
	localparam PHP = 8'h08;
	localparam PLP = 8'h28;
	localparam PHA = 8'h48;
	localparam PLA = 8'h68;
	localparam DEY = 8'h88;
	localparam TAY = 8'hA8;
	localparam INY = 8'hC8;
	localparam INX = 8'hE8;
	localparam CLC = 8'h18;
	localparam SEC = 8'h38;
	localparam CLI = 8'h58;
	localparam SEI = 8'h78;
	localparam TYA = 8'h98;
	localparam CLV = 8'hB8;
	localparam CLD = 8'hD8;
	localparam SED = 8'hF8;
	
	localparam TXA = 8'h8A;
	localparam TXS = 8'h9A;
	localparam TAX = 8'hAA;
	localparam TSX = 8'hBA;
	localparam DEX = 8'hCA;
	localparam NOP = 8'hEA;
	
endmodule
