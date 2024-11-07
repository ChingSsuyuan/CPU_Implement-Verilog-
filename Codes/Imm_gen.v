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

always @(*) begin
        case (opcode)
            7'b1101011: begin
                // Example: concatenate for specific instruction type
                Imm_out = {{19{imm12}}, imm12, imm11, imm10_5, imm4_1, 1'b0};  // 32-bit result
            end
            
            7'b1000011: begin
                Imm_out = {20'b0, immI};  // 32-bit result (sign-extend)
            end
            
            7'b0110000: begin
                Imm_out = {20'b0, immI};  // 32-bit result (sign-extend)
            end
            
            7'b0011111: begin
                Imm_out = {20'b0, immI};  // 32-bit result (sign-extend)
            end
            
            7'b1100011: begin
                // Branch-type instruction with 20-bit immediate
                Imm_out = {imm11_5, imm4_0};  // Combining imm11_5 (7 bits) and imm4_0 (5 bits) to form 32-bit immediate
            end
            
            default: begin
                Imm_out = 32'b0;  // Default case (initialize with zeros)
            end
        endcase
    end

