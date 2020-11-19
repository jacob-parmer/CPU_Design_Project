`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 09:47:01 AM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb(

    );
    
    reg reset, clock;
    reg [15:0] mem_read_data;
    wire [15:0] mem_write_data, mem_addr, reg1Out, reg2Out, probe, probe2;
    
    datapath DUT (.reset(reset), .clock(clock), .mem_read_data(mem_read_data),
                  .mem_write_data(mem_write_data), .mem_addr(mem_addr),
                  .reg1Out(reg1Out), .reg2Out(reg2Out), .probe(probe),
                  .probe2(probe2));
    
    initial
    begin
        clock = 0; reset = 0; mem_read_data = 0;
        #10 reset = 1;
        #10 reset = 0;
        #15 mem_read_data = 16'b0100000111000010; // load immediate value '14' into x10.
        #10 mem_read_data = 16'b0110000000100010; // load immediate value '1' into x11.
        #10 mem_read_data = 16'b1001011101000011; // add reg x10, x11 and store result in x12. (Expected: result = 0xf)
        #10 mem_read_data = 16'b1001011101010011; // subtract reg x10 - x11 and store result in x12. (Expected: result = 0xd)
        #10 mem_read_data = 16'b1000110101100100; // add reg x11 + 6 and store the result in x12. (Expected: result = 0x7)
        #10 mem_read_data = 16'b1000110101010100; // subtract reg x10 - 6 and store the result in x12. (Expected: result = 0x8)
        #10 mem_read_data = 16'b0100000001000010; // load immediate value '2' into x10
        #10 mem_read_data = 16'b1001011101000101; // shift reg x10 to the left by amount specified in x11 (1 bit). Store new val in x12. (Expected: x12 = 4)
        #10 mem_read_data = 16'b1001011101010101; // shift reg x10 to the right by amount specified in x11 (1 bit). Store new val in x12. (Expected: x12 = 1)
        #10 mem_read_data = 16'b1000010101000110; // shift reg x10 to the left by 2. Store new val in x12. (Expected: x12 = 8)
        #10 mem_read_data = 16'b1000001101010110; // shift reg x10 to the right by 1. Store new val in x12. (Expected: x12 = 1)
        #10 mem_read_data = 16'b0100000101000010; // load immediate value '10' into x10
        #10 mem_read_data = 16'b0110000010100010; // load immediate value '5' into x11
        #10 mem_read_data = 16'b1001010101100111; // AND values seen in x10, x11, store result in x12. (Expected: result = 0x0)
        #10 mem_read_data = 16'b1001010101110111; // OR values seen in x10, x11, store result in x12. (Expected: result = 0xf)
        #10 mem_read_data = 16'b1000001101001000; // AND value seen in x10 and '1', store result in x12. (Expected: result = 0x0)
        #10 mem_read_data = 16'b1000001101011000; // OR values seen in x10 and '1', store result in x12. (Expected: result = 0xB)
        #10 mem_read_data = 16'b1111010101101001; // Branch address is set to PC + 7 if value in x10 and x11 are equal. (Expected: PC = PC + 4) 
        #10 mem_read_data = 16'b1111010101111001; // Branch address is set to PC + 7 if value in x10 and x11 are not equal. (Expected: PC = PC + 7)
        #10 mem_read_data = 16'b1111011101001010; // Branch address is set to PC + 7 if value x10 < x11. (Expected: PC = PC + 4)
        #10 mem_read_data = 16'b1111011101011010; // Branch address is set to PC + 7 if value x10 > x11. (Expected: PC = PC + 7)
        #10 mem_read_data = 16'b1111011101001011; // Branch address is set to PC + 7 if value x10 <= x11. (Expected: PC = PC + 4) 
        #10 mem_read_data = 16'b1111011101011011; // Branch address is set to PC + 7 if value x10 >= x11. (Expected: PC = PC + 7)
        #10 mem_read_data = 16'b1000000011111100; // Register x12 is set to PC + 4. New PC is set to 0xf.  
        #10 mem_read_data = 16'b0001010101101110; // Copy the contents of register x10 into register x11. (Expected: x11 = 10) !!!!
        
    end
    
    always
        #5 clock = ~clock;
endmodule
