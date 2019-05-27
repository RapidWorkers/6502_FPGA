/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

`timescale 1ns / 100 ps
module tb_ADDER;
	wire [7:0]S;
	wire Cout, PG, GG;
	reg [7:0]A, B;
	reg Cin;

	CLA_8bit uud(S, Cout, PG, GG, A, B, Cin);
	initial begin
        A = 8'b00000000 ; B = 8'b01110111; Cin = 0;
        #10 A = 8'b00000000 ; B = 8'b01110111; Cin = 1;
        #10 A = 8'b10010100 ; B = 8'b11110111; Cin = 0;
        #10 $stop;
	end
endmodule


