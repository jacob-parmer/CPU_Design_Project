`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 10:18:08 AM
// Design Name: 
// Module Name: 2_to_1_mux
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


module mux(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire s,
    output reg [15:0] out
    );
    
    always @ (a or b or s)
    begin
        if (s)
            out = b;
        else
            out = a;
    end
    
endmodule
