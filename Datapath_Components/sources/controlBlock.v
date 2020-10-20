`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 03:59:02 PM
// Design Name: 
// Module Name: controlBlock
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


module controlBlock(
    input func1,
    input [3:0] opcode,
    input clock,
    output reg [1:0] shiftControl,
    output reg memWrite,
    output reg memRead,
    output reg immType,
    output reg [3:0] ALUSelect,
    output reg COPYREG,
    output reg branchEq,
    output reg branchNeq,
    output reg branchLt,
    output reg branchGt,
    output reg branchLte,
    output reg branchGte,
    output reg jump
    );
    
    always @ (posedge clock)
    begin
        shiftControl = 2'b00; memWrite = 0; memRead = 0; immType = 0; ALUSelect = 4'b0000; COPYREG = 0; branchEq = 0; branchNeq = 0; 
        branchLt = 0; branchGt = 0; branchLte = 0; branchGte = 0; jump = 0;
        case (opcode)
            4'b0000: begin
                     end
            4'b0001: begin 
                        if (func1 == 0)
                            begin
                                memRead = 1;
                            end
                        else 
                            begin
                                memWrite = 1;                          
                            end 
                     end
            4'b0010: begin 
                        if (func1 == 0)
                            begin
                                memRead = 1; immType = 1; 
                            end
                        else 
                            begin
                                memWrite = 1; immType = 1;                            
                            end 
                        end
            4'b0011: begin 
                        if (func1 == 0)
                            begin
                                ALUSelect = 4'b0010; 
                            end
                        else 
                            begin
                                ALUSelect = 4'b0011;                            
                            end 
                        end
            4'b0100: begin 
                       if (func1 == 0)
                           begin
                               immType = 1; ALUSelect = 4'b0010;
                           end
                       else 
                           begin
                               immType = 1; ALUSelect = 4'b0011;                            
                           end 
                       end
            4'b0101: begin 
                         if (func1 == 0)
                             begin
                                 shiftControl = 2'b01;
                             end
                         else 
                             begin
                                 shiftControl = 2'b11;                           
                             end 
                         end
            4'b0110: begin 
                         if (func1 == 0)
                             begin
                                 shiftControl = 2'b01; immType = 1;
                             end
                         else 
                             begin
                                 shiftControl = 2'b11; immType = 1;                          
                             end 
                         end
            4'b0111: begin 
                         if (func1 == 0)
                             begin
                             end
                         else 
                             begin
                                 ALUSelect = 4'b0001;                           
                             end 
                         end
            4'b1000: begin 
                         if (func1 == 0)
                             begin
                                 immType = 1;
                             end
                         else 
                             begin
                                 immType = 1; ALUSelect = 4'b0001;                            
                             end 
                         end
            4'b1001: begin 
                         if (func1 == 0)
                             begin
                                 branchEq = 1;
                             end
                         else 
                             begin
                                 branchNeq = 1;                         
                             end 
                         end
            4'b1010: begin 
                         if (func1 == 0)
                             begin
                                 branchGt = 1;
                             end
                         else 
                             begin 
                                 branchLt = 1;                       
                             end 
                         end
            4'b1011: begin 
                         if (func1 == 0)
                             begin
                                 branchGte = 1;
                             end
                         else 
                             begin
                                 branchLte = 1;                            
                             end 
                         end
            4'b1100: begin 
                         jump = 1; immType = 1;    
                     end
            4'b1101: begin 
                        jump = 1;
                     end
            4'b1110: begin
                        COPYREG = 1;             
                     end
        endcase
    
    end
endmodule
