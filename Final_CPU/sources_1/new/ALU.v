`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 05:01:32 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] ALUSelect,
    input [15:0] data1,
    input [15:0] data2,
    output reg zero,
    output reg [15:0] result
    );
    
    always @ (ALUSelect or data1 or data2)
    begin
        zero = 0;
        case (ALUSelect)
            4'b0000: begin
                        result = data1 & data2;
                        if (result == 0)
                            zero = 1;
                     end 
            4'b0001: begin
                        result = data1 | data2;
                        if (result == 0)
                            zero = 1;
                     end
            4'b0010: begin
                        result = data1 + data2;
                        if (result == 0)
                            zero = 1;
                     end
            4'b0110: begin
                        result = data1 - data2;
                        if (result == 0)
                            zero = 1;
                     end
        endcase
    end
endmodule
