/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

module ALU(
    input clk,
    input rst,
    input [7:0]A, 
    input [7:0]B, 
    input SUMS,
    input ANDS, 
    input ORS, 
    input XORS, 
    input SRS, 
    input BCDS,
    input Cin, 
    output RESULT,
    output OF,
    output Cout,
    output HCout);

    //register output wire
    wire AI, BI;

    //combinational logic result
    wire CL_RESULT;

    //input register
    REGISTER_8bit REGIN_0(clk, rst, A, AI);
    REGISTER_8bit REGIN_1(clk, rst, B, BI);

    //output register
    REGISTER_8bit REGOUT_0(clk, rst, CL_RESULT, OUTPUT);

endmodule
