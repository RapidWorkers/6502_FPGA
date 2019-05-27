/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

//8bit Register module
module REGISTER_8bit(
    input clk,
    input rst,
    input [7:0]D,
    output reg [7:0] Q
);

    //6502 is active-low reset
    always @ (posedge clk or negedge rst) begin
        if(~rst) Q = 8'b00000000;
        else Q <= D;
    end

endmodule
