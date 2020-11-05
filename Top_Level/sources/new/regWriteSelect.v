`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 02:58:13 PM
// Design Name: 
// Module Name: regWriteSelect
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


module regWriteSelect(
    input [15:0] mem_read_instr_data,
    input [15:0] result,
    input [15:0] shiftOut,
    input [15:0] reg1Data,
    input [15:0] PCNoBranch,
    input [1:0] shiftControl,
    input jump,
    input COPYREG,
    output reg [15:0] regWriteData
    );
    
    always @ (mem_read_instr_data or result or shiftOut or reg1Data or shiftControl or jump or COPYREG)
    begin
        if (mem_read_instr_data[4:0] == 5'b00010) begin
            regWriteData = {12'b000000000000, mem_read_instr_data[8:5]}; // LOADI imm value to regWrite
        end
        else if (shiftControl != 2'b00) begin
            regWriteData = shiftOut; // SHIFT left or right to regWrite 
        end
        else if (jump == 1) begin
            regWriteData = PCNoBranch; // JUMPNLINK address to regWrite
        end
        else if (COPYREG == 1) begin
            regWriteData = reg1Data;
        end
        else begin
            regWriteData = result;
        end
        
    end
endmodule
