/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

module ALU(
    input [7:0]A,//Input A
    input [7:0]B,//Input B
    input SUMS,//SUM Flag
    input ANDS,//AND Flag
    input ORS,//OR Flag
    input EORS,//Exclusive OR Flag
    input SRS,//Shift Right Flag
    input BCDS,//BCD Mode Flag
    input Cin,//Carry in
    output RESULT,//Result
    output OF,//Overflow
    output Cout,//Carry out
    output HCout//Half Carry out
);

//use mux to select output

endmodule
