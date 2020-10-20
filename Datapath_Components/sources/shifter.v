`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2020 09:47:21 AM
// Design Name: 
// Module Name: shifter
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


module shifter(
    input [1:0] shiftControl,
    input [15:0] shamt,
    input [15:0] data,
    output reg [15:0] out
    );
    
    always @ (shiftControl or data or shamt)
    begin
        if (shiftControl == 2'b01)
            out = data << shamt;
        else if (shiftControl == 2'b11)
            out = data >> shamt;
        else if (shiftControl == 2'b00)
            out = data;
    end
endmodule
