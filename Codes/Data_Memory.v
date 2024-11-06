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
	input clk,                     
	output reg [31:0] ReadMemData  
);

	reg [3:0] mem_file [15:0];
	integer i;
	initial begin

		for (i = 0; i < 16; i = i + 1) begin
			mem_file[i] = 4'b0;
		end
	end


	always @(posedge clk) begin

		if (MemWrite) begin
			mem_file[ALU_Result[3:0]]     <= WriteMemData[3:0];   
			mem_file[ALU_Result[3:0] + 1] <= WriteMemData[7:4];   
			mem_file[ALU_Result[3:0] + 2] <= WriteMemData[11:8];   
			mem_file[ALU_Result[3:0] + 3] <= WriteMemData[15:12];  
			mem_file[ALU_Result[3:0] + 4] <= WriteMemData[19:16];  
			mem_file[ALU_Result[3:0] + 5] <= WriteMemData[23:20];
			mem_file[ALU_Result[3:0] + 6] <= WriteMemData[27:24];  
			mem_file[ALU_Result[3:0] + 7] <= WriteMemData[31:28];  
		end

		if (MemRead) begin

			ReadMemData <= {mem_file[ALU_Result[3:0] + 7], mem_file[ALU_Result[3:0] + 6],
			                mem_file[ALU_Result[3:0] + 5], mem_file[ALU_Result[3:0] + 4],
			                mem_file[ALU_Result[3:0] + 3], mem_file[ALU_Result[3:0] + 2],
			                mem_file[ALU_Result[3:0] + 1], mem_file[ALU_Result[3:0]]};
		end
	end
endmodule

