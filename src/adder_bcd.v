/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

//two digit CLA BCD Adder

//TODO: Complete Code
//TODO: Should Modify the Logic to use CLA
//Currently, This is Ripple Carry BCD adder!!

module CLA_BCD_2Dig(
    A1,//1st Digit of A
    B1,//1st Digit of B
    A2,//2nd Digit of A
    B2,//2nd Digit of B
    Cin,//Carry In
    S,//BCD Sum
    Cout//BCD Carry out
);
    input [3:0]A1, B1, A2, B2;
    input Cin;

    output [7:0]S;
    output [1:0]Cout;

    wire [3:0]W0, W1;
    wire [1:0]P, G, C;
    
    wire tmp0, tmp1;

    wire [3:0]B_0, B_1;

    assign tmp0 = !(!C[0]&!(W0[3]&W0[2])&!(W0[3]&W0[1]));
    assign B_0[3] = 0;
    assign B_0[2] = tmp0;
    assign B_0[1] = tmp0;
    assign B_0[0] = 0;

    assign tmp1 = !(!C[1]&!(W1[3]&W1[2])&!(W1[3]&W1[1]));
    assign B_1[3] = 0;
    assign B_1[2] = tmp1;
    assign B_1[1] = tmp1;
    assign B_1[0] = 0;

    //blank out Carry Out Port, don't use that since all carry will be calculated by lookahead logic

    //first digit calculation
    //add first
    CLA_4bit CLA1(W0, , P[0], G[0], A1, B1, Cin);
    //add 6 to correct outputif result above is more than 10
	CLA_4bit CLA2(S[3:0], , P[1], G[1], W0, B_0, 0);

    CLA_4bit BCD_1_0(W0, C_0, A1, B1, 0);
    CLA_4bit BCD_1_1(S[3:0], Cout[0], W0, B_0, 0);
    CLA_4bit BCD_2_0(W1, C_1, A2, B2, tmp0);
    CLA_4bit BCD_2_1(S[7:4], Cout[1], W1, B_1, 0);

endmodule
