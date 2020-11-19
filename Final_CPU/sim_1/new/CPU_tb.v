`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 02:06:18 PM
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb(

    );
    
    reg reset, clock;
    reg [3:0] inr;
    wire [15:0] outvalue;
    
    CPU DUT (.reset(reset), .clock(clock), .inr(inr), .outvalue(outvalue));
    
    initial
    begin
       clock = 0; reset = 0;
       #10 reset = 1;
       #10 reset = 0; 
       #10 inr = 10;
       #10 inr = 11;
       #10 inr = 12;
       #10 inr = 13;
       #20 inr = 10;
       #20 inr = 12;
       #30 inr = 10;
       #240 inr = 14;
    end
    
    always
        #5 clock = ~clock;

endmodule
