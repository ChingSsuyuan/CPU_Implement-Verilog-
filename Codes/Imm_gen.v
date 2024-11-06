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
        Imm_out = {{20{imm12}}, imm12, imm11, imm10_5, imm4_1, 1'b0};
    end
endmodule

module ImmGen(
    input [31:0] instruction,
    output reg [31:0] imm_out
);

always @(*) begin
    
    imm_out = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
end

endmodule
