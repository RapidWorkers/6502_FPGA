/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/


module CLA8(//8bit Carry Look-ahead Adder
	input [7:0]A,
	input [7:0]B,
	input Cin,
	output [7:0]S,
	output Cout,
	output C6out //needed for overflow detection
);
	
	//CLB Instance
	wire [7:0] CLB_C;
	CLB8 U0_CLB8(A, B, Cin, CLB_C);
	
	//Full Adders
	PFA U1_PFA(A[0], B[0], Cin, S[0]);
	PFA U2_PFA(A[1], B[1], CLB_C[0], S[1]);
	PFA U3_PFA(A[2], B[2], CLB_C[1], S[2]);
	PFA U4_PFA(A[3], B[3], CLB_C[2], S[3]);
	PFA U5_PFA(A[4], B[4], CLB_C[3], S[4]);
	PFA U6_PFA(A[5], B[5], CLB_C[4], S[5]);
	PFA U7_PFA(A[6], B[6], CLB_C[5], S[6]);
	PFA U8_PFA(A[7], B[7], CLB_C[6], S[7]);
	
	//assign carry
	assign C6out = CLB_C[6];
	assign Cout	=	CLB_C[7];
	
endmodule
