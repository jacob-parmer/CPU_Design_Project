`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 04:11:38 PM
// Design Name: 
// Module Name: controlBlock_tb
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


module controlBlock_tb(

    );
    
    reg func1, clock;
    reg [3:0] opcode;
    
    wire [1:0] shiftControl;
    wire memWrite, memRead, immType, COPYREG, branchEq, branchNeq, branchLt, branchGt, branchLte, branchGte, jump;
    wire [3:0] ALUSelect;
    
    controlBlock DUT (.func1(func1), .opcode(opcode), .clock(clock), .shiftControl(shiftControl), .memWrite(memWrite), .memRead(memRead), .immType(immType), 
                      .ALUSelect(ALUSelect), .COPYREG(COPYREG), .branchEq(branchEq), .branchNeq(branchNeq), .branchLt(branchLt), .branchGt(branchGt),
                      .branchLte(branchLte), .branchGte(branchGte), .jump(jump));
                      
    initial
    begin
        clock = 0; func1 = 0; opcode = 4'b0000;
        #10 opcode = 4'b0001;
        #10 func1 = 1;
        #10 opcode = 4'b0010;
        #10 func1 = 0;
        #10 opcode = 4'b0011;
        #10 func1 = 1;
        #10 opcode = 4'b0100;
        #10 func1 = 0;
        #10 opcode = 4'b0101;
        #10 func1 = 1;
        #10 opcode = 4'b0110;
        #10 func1 = 0;
        #10 opcode = 4'b0111;
        #10 func1 = 1;
        #10 opcode = 4'b1000;
        #10 func1 = 0;
        #10 opcode = 4'b1001;
        #10 func1 = 1;
        #10 opcode = 4'b1010;
        #10 func1 = 0;
        #10 opcode = 4'b1011;
        #10 func1 = 1;
        #10 opcode = 4'b1100;
        #10 func1 = 0;
        #10 opcode = 4'b1101;
        #10 func1 = 1;
        #10 opcode = 4'b1110;
        #10 func1 = 0;
        
    end
    always
        #5 clock = ~clock;
        
endmodule
