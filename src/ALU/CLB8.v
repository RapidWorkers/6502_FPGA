/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

module CLB8(//8bit Carry Look-ahead Block
	input [7:0]A,
	input [7:0]B,
	input Cin,
	output [7:0]Cout
);

	wire [7:0] P, G;
	
	//Propagate
	assign P[0] = A[0] | B[0];
	assign P[1] = A[1] | B[1];
	assign P[2] = A[2] | B[2];
	assign P[3] = A[3] | B[3];
	assign P[4] = A[4] | B[4];
	assign P[5] = A[5] | B[5];
	assign P[6] = A[6] | B[6];
	assign P[7] = A[7] | B[7];
	
	//Generate
	assign G[0] = A[0] & B[0];
	assign G[1] = A[1] & B[1];
	assign G[2] = A[2] & B[2];
	assign G[3] = A[3] & B[3];
	assign G[4] = A[4] & B[4];
	assign G[5] = A[5] & B[5];
	assign G[6] = A[6] & B[6];
	assign G[7] = A[7] & B[7];
	
	//Look-aheading Carries
	assign Cout[0] = (P[0] & Cin) | G[0];
	assign Cout[1] = (P[1] & P[0] & Cin) | (P[1] & G[0]) | G[1];
	assign Cout[2] = (P[2] & P[1] & P[0] & Cin) | (P[2] & P[1] & G[0]) | (P[2] & G[1]) | G[2];
	assign Cout[3] = (P[3] & P[2] & P[1] & P[0] & Cin) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & G[1]) | (P[3] & G[2]) | G[3];
	assign Cout[4] = (P[4] & P[3] & P[2] & P[1] & P[0] & Cin) | (P[4] & P[3] & P[2] & P[1] & G[0]) | (P[4] & P[3] & P[2] & G[1]) | (P[4] & P[3] & G[2]) | (P[4] & G[3]) | G[4];
	assign Cout[5] = (P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin) | (P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[5] & P[4] & P[3] & P[2] & G[1]) | (P[5] & P[4] & P[3] & G[2]) | (P[5] & P[4] & G[3]) | (P[5] & G[4]) | G[5];
	assign Cout[6] = (P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin) | (P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | (P[6] & P[5] & P[4] & P[3] & G[2]) | (P[6] & P[5] & P[4] & G[3]) | (P[6] & P[5] & G[4]) | (P[6] & G[5]) | G[6];
	assign Cout[7] = (P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & Cin) | (P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]) | (P[7] & P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | (P[7] & P[6] & P[5] & P[4] & P[3] & G[2]) | (P[7] & P[6] & P[5] & P[4] & G[3]) | (P[7] & P[6] & P[5] & G[4]) | (P[7] & P[6] & G[5]) | (P[7] & G[6]) | G[7];
	
endmodule
