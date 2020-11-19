`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2020 03:54:30 PM
// Design Name: 
// Module Name: signExtender
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


module signExtender(
    input [3:0] data,
    output reg [15:0] extendedData
    );
    
    always @ (data)
    begin
        if (data[3] == 1'b1)
        begin
            extendedData = {12'b111111111111, data};  
        end
        else begin
            extendedData = {12'b000000000000, data};
        end
    end
endmodule
