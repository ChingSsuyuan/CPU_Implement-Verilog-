`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Siyuan Jing
// 
// Create Date: 11/04/2024 02:58:47 PM
// Design Name: 
// Module Name: Main_Control_Unit
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
//////////////////////////////////////////////////////////////////////////////////
module Main_Control_Unit(
    input [31:0] ReadInstruction,
    output reg [3:0]Alucontrol,
    output reg Alusrc,
    output reg MemtoReg,
    output reg Regwrite,
    output reg Memread,
    output reg Memwrite,
    output reg Branch
    );
    
    wire [2:0]funct3;
    wire Instr30;
    wire [6:0]opcode;

    assign opcode = ReadInstruction[6:0];       
    assign funct3 = ReadInstruction[14:12];     
    assign Instr30 = ReadInstruction[30];
    initial begin
        Alucontrol=4'b0000;
        Alusrc=  0;
        MemtoReg=0;
        Regwrite=0;
        Memread= 0;
        Memwrite=0;
        Branch= 0;
    end
