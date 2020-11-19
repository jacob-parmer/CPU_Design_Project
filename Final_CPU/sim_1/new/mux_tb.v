`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 10:28:51 AM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb(

    );
    
    reg [15:0] a, b;
    reg s;
    wire [15:0] out;
    
    mux DUT (.a(a), .b(b), .s(s), .out(out));
    
    initial
    begin
        a = 0; b = 0; s = 0;
        #10 a = 16'hFF;
        #10 s = 1;
        #10 b = 16'h02;
        #10 s = 0;
        
    end
endmodule
