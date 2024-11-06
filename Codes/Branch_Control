`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Siyuan Jing & Haonan Wu
// 
// Create Date: 11/04/2024 03:06:06 PM
// Design Name: 
// Module Name: Branch_Control
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


module Branch_Control(
    input [31:0] immgen,
    input [31:0] pc1,
    input zero,
    input branch,
    output reg [31:0] pc2
    );
    reg [31:0] pc_adder;
    reg mux_src;
    
    
    always @(*) begin
        pc_adder = pc1 + immgen;
        mux_src = branch & zero;  
        pc2 = (mux_src) ? pc_adder : pc1+1;
    end

    
endmodule
