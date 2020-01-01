/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

module CPU_6502_Top(
    input clk,//CLOCK INPUT
    input res,//RESET, Active Low
    input RDY,//READY
    input IRQ,//Interrupt Request
    input NMI,//Non Maskable Interrupt
    output SYNC,//Synchronize
    output SO,//Set Overflow, Active Low
    output CLKOUT_2,//Clock Out 2, same phase w/ clk
    output CLKOUT_1,//Clock Out 1, 180 degrees out of phase w/ clk
    output RW,//Read and Write, when reading = HIGH
    output [15:0]ADDR_BUS,//16bit Address Bus
    inout [7:0]DATA_BUS//8bit Data Bus
);
	
	//assign clock output
	assign CLKOUT_2 = clk;
	assign CLKOUT_1 = ~clk;
	
	//Register File
	REG_FILE REG_FILE(CLKOUT_1, CLKOUT_2, RDY, rst, ACC_EN, IDX_EN, IDY_EN, SP_EN, PC_EN,
	SR_EN, ACC_D, IDX_D, IDY_D, SP_D, PC_D, SR_D, ACC_Q, IDX_Q, IDY_Q, SP_Q, PC_Q, SR_Q);
	
	wire ACC_EN;
	wire IDX_EN;
	wire IDY_EN;
	wire SP_EN;
	wire PC_EN;
	wire SR_EN;
	wire [7:0] ACC_D;
	wire [7:0] IDX_D;
	wire [7:0] IDY_D;
	wire [7:0] SP_D;
	wire [7:0] PC_D;
	wire [7:0] SR_D;
	wire [7:0] ACC_Q;
	wire [7:0] IDX_Q;
	wire [7:0] IDY_Q;
	wire [15:0] SP_Q;
	wire [7:0] PC_Q;
	wire [7:0] SR_Q;
	
	//Address Register
	REG_EN_8bit ADH(clk, res, /*enabler*/, /*frombus*/, A[7:0]); 
	REG_EN_8bit ADL(clk, res, /*enabler*/, /*frombus*/, A[15:8]); 
	
	//Instruction Decoder
	
	
	//Arithematic Logic Unit
	//ALU ALU(
endmodule
