`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 03:58:12 PM
// Design Name: 
// Module Name: signExtender_tb
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


module signExtender_tb(

    );
    
    reg [3:0] data;
    
    wire [15:0] extendedData;
    
    signExtender DUT (.data(data), .extendedData(extendedData));
    
    initial
    begin
        data = 0;
        #10 data = 4'b0101;
        #10 data = 4'b1001;
        #10 data = 4'b1111;
        #10 data = 4'b0111;
    end
    
    
endmodule
