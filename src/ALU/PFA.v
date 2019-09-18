/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/


module PFA(//Partial(w/o Carry output) Full Adder 
	input A,
	input B,
	input Cin,
	output S
);
	wire W0;

	//Sum
	xor XOR1(W0, A, B);
	xor XOR2(S, W0, Cin);

endmodule
