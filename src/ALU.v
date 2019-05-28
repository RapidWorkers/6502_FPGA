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
    output reg HCout//Half Carry out(Decimal Adjustmented)
);

wire [5:0]Control = {BCDS, SUMS, ANDS, ORS, EORS, SRS};
wire [7:0]BIN_SUM, BCD_SUM;
wire BIN_SUM_Cout, BCD_SUM_Cout;

CLA_8bit CLA1(BIN_SUM, SUM_Cout, , , A, B, Cin);
CLA_BCD_2Dig BCD_CLA1(BCD_SUM, BCD_SUM_Cout, A, B, Cin);

//use mux to select output
//may changed since not completed
always @(*) begin
    case (Control)
        6'b000001: begin//Shift Right
            Cout = A[0];
            RESULT = A >> 1;
        end
        6'b000010: RESULT = A ^ B;
        6'b000100: RESULT = A | B;
        6'b001000: RESULT = A & B;
        6'b010000: begin//Binary Sum
            RESULT = BIN_SUM;
            Cout = BCD_SUM_Cout;
        end
        6'b110000: begin //BCD Sum
            RESULT = BCD_SUM;
        end
        default: RESULT = 8'b00000000; //Unknown ALU Control Bit
    endcase
end
endmodule
