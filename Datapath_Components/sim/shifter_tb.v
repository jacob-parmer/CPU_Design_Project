`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2020 10:22:48 AM
// Design Name: 
// Module Name: shifter_tb
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


module shifter_tb(
    );
    
    reg [1:0] shiftControl;
    reg [15:0] shamt, data;
    
    wire [15:0] out;
    
    shifter DUT (.shiftControl(shiftControl), .shamt(shamt), .data(data), .out(out));
    
    initial
    begin
        shiftControl = 0; shamt = 0; data = 0;
        #10 data = 16'h04;
        #10 shiftControl = 1;
        #10 shamt = 16'h05;
        #10 shiftControl = 0;
        #10 shamt = 16'h01;
        #10 shiftControl = 3;     
    end
    
endmodule
