`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 10:00:21 AM
// Design Name: 
// Module Name: registerFile_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module registerFile_tb(

    );
    
    reg clock, reset, controlRegWrite;
    reg [4:0] readReg1, readReg2, writeReg, inr;
    reg [15:0] writeData;
    
    wire [15:0] reg1Data, reg2Data, outvalue;
    
    registerFile DUT (.clock(clock), .reset(reset), .controlRegWrite(controlRegWrite), .readReg1(readReg1),
                      .readReg2(readReg2), .writeReg(writeReg), .writeData(writeData), .inr(inr),
                      .reg1Data(reg1Data), .reg2Data(reg2Data), .outvalue(outvalue));
                      
    initial
    begin
        clock = 0; reset = 0; controlRegWrite = 0; readReg1 = 0; readReg2 = 0; writeReg = 0; writeData = 0; inr = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 writeReg = 5;
        #10 writeData = 16;
        #10 controlRegWrite = 1;
        #10 controlRegWrite = 0;
        #10 readReg1 = 5;
        
        #10 writeReg = 11;
        #10 writeData = 24;
        #10 controlRegWrite = 1;
        #10 controlRegWrite = 0;
        #10 readReg2 = 11;
        
        #10 inr = 5;
        #10 inr = 11;
        
    end
    
    always
    begin
        #5 clock = ~clock;
    end
    
    
endmodule
