/*
6502 Implemention in Verilog

Copyright (c) <2019> S.H Kim (soohyunkim@kw.ac.kr)

See the file LICENSE for copying permission.
*/

module CPU_6502_Top(
    input clk,//CLOCK INPUT
    input res,//RESET, Active Low
    input RDY,//READY
    input IRQ,//Interrupt Request
    input NMI,//Non Maskable Interrupt
    output SYNC,//Synchronize
    output SO,//Set Overflow, Active Low
    output CLKOUT_2,//Clock Out 2, same phase w/ clk
    output CLKOUT_1,//Clock Out 1, 180 degrees out of phase w/ clk
    output RW,//Read and Write, when reading = HIGH
    output [15:0]ADDR_BUS,//16bit Address Bus
    inout [7:0]DATA_BUS//8bit Data Bus
);
endmodule