`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Siyuan Jing & Haonan Wu
// 
// Create Date: 11/04/2024 05:51:45 PM
// Design Name: 
// Module Name: Decode
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
