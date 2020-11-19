`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2020 08:49:55 AM
// Design Name: 
// Module Name: PCRegister
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


module PCRegister(
    input reset,
    input clock,
    input [15:0] next,
    output reg [15:0] current
    );
    
    always @ (posedge clock or posedge reset)
    begin
        if (reset)
            current = 0;
        else
            current = next;
    end
endmodule
