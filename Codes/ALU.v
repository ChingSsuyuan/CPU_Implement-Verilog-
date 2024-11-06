`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Siyuan Jing & Haonan Wu
// 
// Create Date: 11/04/2024 03:08:06 PM
// Design Name: 
// Module Name: ALU
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
module ALU (
    input [31:0] A,           
    input [31:0] B,        
    input [3:0] ALU_Control,  
    output reg [31:0] ALU_Result,
    output reg zero           
);
    initial begin
        zero=1'b0;
        ALU_Result= 32'b0;
    end
    
    always @(*) begin
        case (ALU_Control)
            4'b0000: ALU_Result = A & B;         
            4'b0001: ALU_Result = A | B;           
            4'b0010: ALU_Result = A ^ B;            
            4'b0011: ALU_Result = A >>> B[4:0];   
            4'b0100: ALU_Result = A << B[4:0];      
            4'b0101: ALU_Result= A - B;         
            4'b0110: ALU_Result = A + B;            
            4'b0111: ALU_Result = (A < B) ? 1 : 0; 
            4'b1000: zero = (A==B) ? 1 : 0;
            4'b1001: zero = (A<B) ? 1 : 0;
            4'b1100:  ALU_Result = B;
            
            default: ALU_Result= 32'b0;            
        endcase
        
    end
endmodule
