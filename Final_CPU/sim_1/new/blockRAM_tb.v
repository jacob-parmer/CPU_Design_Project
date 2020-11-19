`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 08:44:17 AM
// Design Name: 
// Module Name: blockRAM_tb
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


module blockRAM_tb(

    );
    
    reg clock, we, en;
    reg [9:0] addr;
    reg [15:0] di;
    wire [15:0] dout, temp_data;
    
    blockRAM DUT (.clock(clock), .we(we), .en(en), .addr(addr), .di(di),
                  .dout(dout), .temp_data(temp_data));
    
    initial
    begin
        clock = 0; we = 0; en = 0; addr = 0; di = 0;
        #10 en = 1; addr = 0;
        #10 addr = 2; we = 1; di = 10;
        #10 addr = 3; di = 15;
        #10 addr = 4; di = 25;
        #10 we = 0; addr = 2;
        #10 addr = 3;
        #10 addr = 4;
        #10 addr = 5;
        #10 en = 0; we = 1; addr = 4; di = 20;
        #10 we = 0;
        
    end
    
    always
        #5 clock = ~clock;
        
endmodule
