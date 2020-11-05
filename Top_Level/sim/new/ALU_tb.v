`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 05:09:01 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(

    );
    
    reg [3:0] ALUSelect;
    reg [15:0] data1, data2;
    
    wire zero;
    wire [15:0] result;
    
    ALU DUT (.ALUSelect(ALUSelect), .data1(data1), .data2(data2), .zero(zero), .result(result));
    
    initial
    begin
        ALUSelect = 0; data1 = 0; data2 = 0;
        #10 data1 = 5;
        #10 data2 = 1;
        #10 ALUSelect = 1;
        #10 ALUSelect = 2;
        #10 ALUSelect = 6;
    end
endmodule
