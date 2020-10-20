`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2020 08:51:31 AM
// Design Name: 
// Module Name: PCRegister_tb
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


module PCRegister_tb(

    );
    
    reg  reset, clock;
    reg [15:0] next;
    
    wire [15:0] current;
    
    PCRegister DUT (.reset(reset), .clock(clock), .next(next), .current(current));
    
    initial
    begin
        reset = 0; clock = 0; next = 16'h00;
        #10 reset = 1;
        #10 next = 16'h04; reset = 0;
        #10 next = 16'h08;
        #10 next = 16'h0C;
        #10 next = 16'hFE;
    end
    
    always
        #5 clock = ~clock;
    
endmodule
