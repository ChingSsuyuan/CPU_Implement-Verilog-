`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Siyuan Jing and Haonan Wu
// 
// Create Date: 11/04/2024 02:58:47 PM
// Design Name: 
// Module Name: Program Counter
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


module Program_Counter(
    input clk,
    input [31:0] pc2,
    output reg [31:0] pc
);
    initial begin
        pc = 32'b0;
    end
    
    always @(posedge clk) begin
          pc <= pc2;    
    end
endmodule
