/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/


/*
	1. 6502 uses One Hot Encoding for Operator Flags.
	2. ALU has Decimal Mode for Adder
*/

module ALU(
    input [7:0]A,//Input A
    input [7:0]B,//Input B
    input SUMS,//SUM Flag
    input ANDS,//AND Flag
    input ORS,//OR Flag
    input EORS,//Exclusive OR Flag
    input SRS,//Shift Right Flag
    input DEC_En,//Enable Decimal Mode Flag
    input Cin,//Carry in
    output reg [7:0]RESULT,//Result
    output OF,//Overflow
    output Cout,//Carry out
    output HCout//Half Carry out(Decimal Adjustmented)
);
	
	//Control flags
	wire [5:0]Control = {DEC_En, SUMS, ANDS, ORS, EORS, SRS};
	
	
	//AND
	wire RESULT_AND;
	assign RESULT_AND = A & B;
	
	//OR
	wire RESULT_OR;
	assign RESULT_OR = A | B;
	
	//EOR
	wire RESULT_EOR;
	assign RESULT_EOR = A ^ B;
	
	//Shift Right
	wire RESULT_SR;
	assign RESULT_SR = A >> B;
	
	//Binary Adder
	wire [7:0]RESULT_BIN_SUM;
	wire SUM_Cout, SUM_C6;
	CLA8 U0_CLA8(A, B, Cin, RESULT_BIN_SUM, SUM_Cout, SUM_C6);
	
	//BCD Adder
	wire [7:0]RESULT_BCD_SUM;
	wire BCD_Cout, BCD_HCout;
	BCD_CLA U1_BCD_CLA(A, B, Cin, RESULT_BCD_SUM, BCD_Cout, BCD_HCout);
	
	//overflow calculation
	//assign OF = (SUMS == 1)?(DEC_En
	
	//assigning carry out
	

always @(Control) begin
    case (Control)
        6'b000001: 
				RESULT <= RESULT_AND;
        6'b000010:
				RESULT <= RESULT_OR;
        6'b000100:
				RESULT <= RESULT_EOR;
        6'b001000:
				RESULT <= RESULT_SR;
        6'b010000:
            RESULT <= RESULT_BIN_SUM;
        6'b110000:
            RESULT <= RESULT_BCD_SUM;
        default:
				RESULT <= 8'b00000000; //Unknown ALU Control
    endcase
end
endmodule
