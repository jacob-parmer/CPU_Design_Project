`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 08:28:36 AM
// Design Name: 
// Module Name: blockRAM
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


module blockRAM(
    input clock,
    input we,
    input en,
    input [9:0] addr,
    input [15:0] di,
    output reg [15:0] dout
    );

    reg [15:0] RAM [1023:0];

    initial $readmemb ("memory.mem", RAM, 0, 1023); // initializes RAM to data stored in memory.mem

    always @ (posedge clock or addr)
    begin
        if (en)
        begin
            if (we)
            begin
                RAM[addr] <= di;
                dout <= di;
            end
            else
                dout <= RAM[addr];
        end
    end
endmodule
