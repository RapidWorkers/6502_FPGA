/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

//8bit carry look ahead adder
module CLA_8bit(S, Cout, PG, GG, A, B, Cin);
	output [7:0]S;
	output Cout, PG, GG;
	input [7:0]A, B;
	input Cin;
	wire [1:0]P, G, C;

	//carry look-ahead logic
	CL_2bit CL1(C, PG, GG, Cin, P, G);

	//use two 4bit CLA Adder
	//blank out Carry Out Port, don't use that since all carry will be calculated by lookahead logic
	CLA_4bit CLA1(S[3:0], , P[0], G[0], A[3:0], B[3:0], Cin);
	CLA_4bit CLA2(S[7:4], , P[1], G[1], A[7:4], B[7:4], C[0]);

	//assign carry
	assign Cout = C[1];

endmodule


//4bit carry look ahead adder
module CLA_4bit(S, Cout, PG, GG, A, B, Cin);
	output [3:0]S;
	output Cout, PG, GG;
	input [3:0]A, B;
	input Cin;
	wire [3:0]P, G, C;

	//carry look-ahead logic
	CL_4bit CL1(C, PG, GG, Cin, P, G);

	//use Partial(w/o carry out) Full Adder
	PFA_1bit PFA1(S[0], P[0], G[0], A[0], B[0], Cin);
	PFA_1bit PFA2(S[1], P[1], G[1], A[1], B[1], C[0]);
	PFA_1bit PFA3(S[2], P[2], G[2], A[2], B[2], C[1]);
	PFA_1bit PFA4(S[3], P[3], G[3], A[3], B[3], C[2]);

	//assign carry
	assign Cout = C[3];
	
endmodule

//4bit carry look ahead logic
module CL_4bit(Cout, PG, GG, Cin, P, G);
	output [3:0]Cout;
	output PG, GG;
	
	input [3:0]P, G;
	input Cin;

	assign PG = P[3] & P [2] & P[1] & P[0];
	assign GG = G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]);
	
	
	assign Cout[0] = G[0] | (P[0] & Cin);
	assign Cout[1] = G[1] | (P[1] & Cout[0]);
	assign Cout[2] = G[2] | (P[2] & Cout[1]);
	assign Cout[3] = G[3] | (P[3] & Cout[2]);

endmodule

//2bit carry look ahead logic
module CL_2bit(Cout, PG, GG, Cin, P, G);
	output [1:0]Cout;
	output PG, GG;
	
	input [1:0]P, G;
	input Cin;

	assign PG = P[1] & P [0];
	assign GG = G[1] | (G[0] & P[1]);
	
	//use extended equations to ignore carry rippling
	assign Cout[0] = G[0] | (P[0] & Cin);
	assign Cout[1] = G[1] | (P[1] & (G[0] | (P[0] & Cin)));

endmodule

//Partial(w/o Carry output) Full Adder 
module PFA_1bit(S, P, G, A, B, Cin);
	output S, P, G;
	input A, B, Cin;

	wire W0;

	//Sum
	xor XOR1(W0, A, B);
	xor XOR2(S, W0, Cin);

	//Generate
	assign G = A & B;
	//Propagate
	assign P = A ^ B;

endmodule
