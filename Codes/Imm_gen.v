`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Siyuan Jing and Haonan Wu
// 
// Create Date: 11/04/2024 02:58:47 PM
// Design Name: 
// Module Name: Imm_gen
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

module Imm_gen(
    input [31:0] Instruction32,
    output reg [31:0] Imm_out
);
    wire imm12 = Instruction32[31];         
    wire imm10_5 = Instruction32[30:25];   
    wire imm4_1 = Instruction32[11:8];       
    wire imm11 = Instruction32[7]; 
    always @(*) begin  
        Imm_out = {{19{imm12}}, imm12, imm11, imm10_5, imm4_1, 1'b0};
    end
endmodule

module Imm_gen(
    input [31:0] Instruction32,
    output reg [31:0] Imm_out
);
    wire [6:0]opcode;
    wire imm12 = Instruction32[31];         
    wire [5:0] imm10_5 = Instruction32[30:25];   
    wire [3:0] imm4_1 = Instruction32[11:8];       
    wire imm11 = Instruction32[7]; 
    wire [11:0] immI = Instruction32[11:0];
    wire [6:0] imm11_5=Instruction32[31:25]; 
    wire [4:0]imm4_0=Instruction32[11:7]; 
    
    always @(*) begin  
        if (opcode==7'b1101011) begin
        Imm_out = {{19{imm12}}, imm12, imm11, imm10_5, imm4_1, 1'b0};
        end
        
        if (opcode==7'b1000011) begin
            Imm_out={20'b0,immI};
        end
        
        if (opcode==7'b0110000) begin
            Imm_out={20'b0,immI};
        end
        
        if (opcode==7'b0011111) begin
            Imm_out={20'b0,immI};
        end
        
        if (opcode==7'b1100011) begin
            Imm_out = {20'b0,imm11_5.imm4_0};
        end
        
        else begin
            Imm_out=Instruction32;
        end
    end
    
endmodule

