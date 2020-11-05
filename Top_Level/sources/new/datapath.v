`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 09:39:22 AM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input reset,
    input clock,
    input [15:0] mem_read_instr_data,
    input [15:0] mem_read_data,
    output [15:0] mem_write_data,
    output [15:0] mem_addr,
    output [15:0] reg1Out,
    output [15:0] reg2Out,
    output [15:0] probe,
    output [15:0] probe2
    );
    
    wire [15:0] next, current, PCNoBranch;
    wire zero1, zero2, zero3;
    
    // control wires
    wire [1:0] shiftControl;
    wire [3:0] ALUSelect;
    wire memWrite, memRead, controlRegWrite,immType, COPYREG, branchEq, branchNeq, branchLt, branchGt, branchLte, branchGte, jump;
    
    // reg wires
    wire [15:0] reg1Data, reg2Data, immExtendedData, immMuxOut, regWriteData;
    wire [15:0] result;
    wire [3:0] writeReg;
    
    // branch wires
    wire a, b, c, d, e, f, g, h, i, j, k;
    wire controlBranch;
    wire [15:0] branchAddress, branchMuxOut;
    
    // shift wires
    wire [15:0] shiftOut, shiftAmountData;
       
    // Adds 4 to PC.
    ALU PCUpdater (.ALUSelect(4'b0010), .data1(16'h04), .data2(current), .zero(zero1), .result(PCNoBranch));    
    PCRegister PCReg (.reset(reset), .clock(clock), .next(next), .current(current));
    assign mem_addr = current;
    
    // handles control of the datapath.
    controlBlock dataControl (.func1(mem_read_instr_data[4]), .opcode(mem_read_instr_data[3:0]), .clock(clock), .reset(reset),
                              .shiftControl(shiftControl), .memWrite(memWrite), .memRead(memRead), .regWrite(controlRegWrite), .immType(immType),
                              .ALUSelect(ALUSelect), .COPYREG(COPYREG), .branchEq(branchEq), .branchNeq(branchNeq),
                              .branchLt(branchLt), .branchGt(branchGt), .branchLte(branchLte), .branchGte(branchGte),
                              .jump(jump));
                              
    // Registers inside the datapath
    // TODO: change .writeReg for COPYREG support!!!!!
    regWriteSelect RWSelector (.mem_read_instr_data(mem_read_instr_data), .result(result), .PCNoBranch(PCNoBranch),
                               .shiftOut(shiftOut), .reg1Data(reg1Data), .shiftControl(shiftControl),
                               .jump(jump), .COPYREG(COPYREG), .regWriteData(regWriteData)); 
                               
    mux writeRegSelector (.a({1, mem_read_instr_data[15:13]}), .b(mem_read_instr_data[8:5]), .s(COPYREG), .out(writeReg));   
            
    registerFile dataRegisters (.clock(clock), .reset(reset), .controlRegWrite(controlRegWrite), .readReg1(mem_read_instr_data[8:5]), 
                                .readReg2(mem_read_instr_data[12:9]), .writeReg({1, mem_read_instr_data[15:13]}), .writeData(regWriteData),
                                .reg1Data(reg1Data), .reg2Data(reg2Data));
    assign reg1Out = reg1Data;
    assign reg2Out = reg2Data;
    assign probe = result;
    assign probe2 = regWriteData;
        
    signExtender immExtender (.data(mem_read_instr_data[12:9]), .extendedData(immExtendedData));
    mux reg2DataOrImmMux (.a(reg2Data), .b(immExtendedData), .s(immType), .out(immMuxOut));
    ALU regALU (.ALUSelect(ALUSelect), .data1(reg1Data), .data2(immMuxOut), .zero(zero2), .result(result));  
    
    // branching selection wires. If any branch is detected, PC is updated with branch value instead of with
    // previous value + 4.
    assign a = zero2 & branchEq;
    assign b = ~zero2 & branchNeq;
    assign c = ~result[15] & branchGt;
    assign d = result[15] & branchLt;
    assign e = ~result[15] & branchGte;
    assign f = zero2 & branchGte;
    assign g = e | f;
    assign h = result[15] & branchLte;
    assign i = zero2 & branchLte;
    assign j = h | i;
    assign controlBranch = a | b | c | d | g | j;
    
    ALU branchALU (.ALUSelect(4'b0010), .data1({13'b0000000000000, mem_read_instr_data[15:13]}),
                   .data2(current), .zero(zero3), .result(branchAddress));
                   
    mux branchMux (.a(PCNoBranch), .b(branchAddress), .s(controlBranch), .out(branchMuxOut));
    mux jumpMux (.a(branchMuxOut), .b({8'b00000000, mem_read_instr_data[12:4]}), .s(jump), .out(next));
    
    mux shifterImmMux (.a(reg2Data), .b({12'b000000000000, mem_read_instr_data[12:9]}), .s(immType), .out(shiftAmountData));
    shifter regShift (.shiftControl(shiftControl), .shamt(shiftAmountData),
                      .data(reg1Data), .out(shiftOut));                
    


    
    
    
    
endmodule
