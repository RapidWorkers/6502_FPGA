/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

//Tri-state buffer module

module tri_buf(
	input a, //input
	input en, //enable
	output reg y //output
);
	
	always @(en) begin
		if(~en) y <= 1'bz; //high impedance
		else y <= a; //work as buffer
	end
	
endmodule
