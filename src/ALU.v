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
    output reg [7:0]RESULT,//Result
    output reg OF,//Overflow
    output reg Cout,//Carry out
    output reg HCout//Half Carry out
);

wire [4:0]Control = {SUMS, ANDS, ORS, EORS, SRS};
wire [7:0]BIN_SUM, BCD_SUM;
wire SUM_Cout;

CLA_8bit CLA1(BIN_SUM, SUM_Cout, , , A, B, Cin);

//use mux to select output
always @(Control) begin
    case (Control)
        5'b00001: begin
            Cout <= A[0];
            RESULT <= A >> 1;
        end
        5'b00010: RESULT = A ^ B;
        5'b00100: RESULT = A | B;
        5'b01000: RESULT = A & B;
        5'b10000: RESULT = BIN_SUM;
        default: RESULT = 5'b00000; 
    endcase
end
endmodule
