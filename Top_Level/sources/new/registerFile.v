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
    input [3:0] readReg1,
    input [3:0] readReg2,
    input [3:0] writeReg,
    input [15:0] writeData,
    output reg [15:0] reg1Data,
    output reg [15:0] reg2Data
    );
    
  reg [3:0] registers [15:0];
  integer i;
  
  always @ (negedge clock)
  begin
    if (reset)
    begin
        for (i = 0; i < 16; i = i + 1)
        begin
            registers[i] = 16'h0000;
        end
    end
    else
    begin
        reg1Data = registers[readReg1];
        reg2Data = registers[readReg2];
        
        if (controlRegWrite) begin
            registers[writeReg] = writeData;
        end
    end 
  end
  
endmodule
