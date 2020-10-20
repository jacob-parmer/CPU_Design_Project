`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 09:51:03 AM
// Design Name: 
// Module Name: registerFile
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


module registerFile(
    input clock,
    input reset,
    input controlRegWrite,
    input [4:0] readReg1,
    input [4:0] readReg2,
    input [4:0] writeReg,
    input [15:0] writeData,
    input [3:0] inr,
    output reg [15:0] reg1Data,
    output reg [15:0] reg2Data,
    output reg [15:0] outvalue
    );
    
  reg [4:0] registers [15:0];
  integer i;
  
  always @ (negedge clock)
  begin
    if (reset)
    begin
        for (i = 0; i < 16; i = i + 1)
        begin
            registers[i] = 16'h00;
        end
    end
    else if (controlRegWrite)
    begin
        registers[writeReg] = writeData;
    end
    else
    begin
        reg1Data = registers[readReg1];
        reg2Data = registers[readReg2];
    end 
  end
  
  always @ (negedge clock)
  begin
    outvalue = registers[inr];
  end
  
  
endmodule
