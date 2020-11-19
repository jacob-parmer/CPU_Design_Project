`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 08:28:06 AM
// Design Name: 
// Module Name: CPU
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


module CPU(
    input reset,
    input clock,
    input [3:0] inr,
    output [15:0] outvalue
    );
    
    wire [15:0] instr_mem_out, data_mem_out; 
    wire [15:0] instr_addr, data_addr, data_mem_addr;
    wire [15:0] write_data;
    wire we, en;
    
    datapath DTPTH (.reset(reset), .clock(clock), .instr_mem_read_data(instr_mem_out), .data_mem_read_data(data_mem_out),
                    .inr(inr), .data_mem_write_data(write_data), .instr_mem_addr(instr_addr), .data_mem_addr(data_addr),
                    .mem_enable(en), .mem_write_enable(we), .outvalue(outvalue));
                    
    blockRAM INSTR_MEMORY (.clock(clock), .we(1'b0), .en(1'b1), .addr(instr_addr[9:0]), .di(16'h00), .dout(instr_mem_out));  
    
    assign data_mem_addr = data_addr + 512; // data address 0 = 512 (starts at half the memory size)
    
    blockRAM DATA_MEMORY (.clock(clock), .we(we), .en(en), .addr(data_mem_addr[9:0]), .di(write_data), .dout(data_mem_out));
                  
endmodule
