`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BU
// Engineer: Haonan Wu & Siyuan Jing
// 
// Create Date: 10/29/2024 02:49:52 PM
// Design Name: 
// Module Name: Data_Memory
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

module Data_Memory(
	input [31:0] ALU_Result,      
	input [31:0] WriteMemData,     
	input MemWrite,               
	input MemRead,                
	output reg [31:0] ReadMemData  
);


	reg [31:0] mem_file [15:0];
	integer i;


	initial begin
		for (i = 0; i < 16; i = i + 1) begin
			mem_file[i] = 32'b0;
		end
	end


	always @(*) begin
		if (MemWrite) begin
			mem_file[ALU_Result[3:0]] = WriteMemData;
		end
	end


	always @(*) begin
		if (MemRead) begin
			ReadMemData = mem_file[ALU_Result[3:0]];
		end else begin
			ReadMemData = 32'b0;
		end
	end
endmodule
