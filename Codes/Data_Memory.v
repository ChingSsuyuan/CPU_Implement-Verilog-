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
	input [31:0] ALU_Result,       // 地址
	input [31:0] WriteMemData,     // 写入数据
	input MemWrite,                // 写入使能
	input MemRead,                 // 读取使能
	output reg [31:0] ReadMemData  // 读取数据
);

	// 32位宽的16个存储单元
	reg [31:0] mem_file [15:0];
	integer i;

	// 初始化存储为0
	initial begin
		for (i = 0; i < 16; i = i + 1) begin
			mem_file[i] = 32'b0;
		end
	end

	// 写操作
	always @(*) begin
		if (MemWrite) begin
			mem_file[ALU_Result[3:0]] = WriteMemData;
		end
	end

	// 读操作
	always @(*) begin
		if (MemRead) begin
			ReadMemData = mem_file[ALU_Result[3:0]];
		end else begin
			ReadMemData = 32'b0;
		end
	end
endmodule
