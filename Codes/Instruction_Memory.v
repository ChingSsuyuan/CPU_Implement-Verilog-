`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Siyuan Jing and Haonan Wu
// 
// Create Date: 11/05/2024 02:58:47 PM
// Design Name: 
// Module Name: IMem
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

	module Instruction_Memory(Address, ReadData1);
	parameter BITSIZE = 32;
	parameter REGSIZE = 32;
	input [REGSIZE-1:0] Address;
	output reg [BITSIZE-1:0] ReadData1;

	reg [BITSIZE-1:0] memory_file [0:REGSIZE-1];	// Entire list of memory
//    reg [6:0] opcode;
//    reg [2:0] funct3;
//    reg [6:0] funct7;

	// Asyncronous read of memoQuick Accessry. Was not specified.
	always @(Address, memory_file[Address])
	begin
	   ReadData1 = memory_file[Address]; 
	end

	integer i;
	// method of filling the memory instead of through a test bench
	initial
		begin
			i = 0;
			memory_file[i] = 32'b0000000_00010_00001_000_00011_1110011;//And x3 x1 x2
			
			i = i+1;
			memory_file[i] = 32'b0000000_00010_00001_001_00011_1110011;//ADD x3 x1 x2
			
			i = i+1;
			memory_file[i] = 32'b0000000_00010_00001_010_00011_1110011;//OR x3 x1 x2
			
			i = i+1;
			memory_file[i] = 32'b0100000_00010_00001_001_00011_1110011;//SUB x3 x1 x2
			
			i = i+1;
			memory_file[i] = 32'b0000000_00010_00001_100_00011_1110011;//Xor x3 x1 x2
			
			i = i+1;
			memory_file[i] = 32'b0000000_00010_00001_101_00011_1110011;//SRA x3 x1 x2
            
            i = i+1;
			memory_file[i] = 32'b0000000_00010_00001_110_00011_1110011;//sll x3 x1 x2
			
			i = i+1;
			memory_file[i] = 32'b0000000_00010_00001_111_00011_1110011;//slt x3 x1 x2
			
			i = i+1;
			memory_file[i] = 32'b0_010001_00010_00001_000_0000_0_1101011;//beq x1 x2 0x110
			
			i = i+1;
			memory_file[i] = 32'b0_010001_00010_00001_001_0000_0_1101011;//BLT x1 x2 0x110
			
			i = i+1;
			memory_file[i] = 32'b0001000_00010_00001_010_10000_1100011;//sw x1 0x110(x2) 
			
            i = i+1;
			memory_file[i] = 32'b000100010000_00010_010_00001_1000011;//lw x1 0x110(x2)
            
            i=i+1;
			memory_file[i] = 32'b00010001000000000000_00001_0110000;//lui x1 0x110
		
			i = i+1;
			memory_file[i] = 32'b000100010000_00001_000_00010_0011111;//Addi x2 x1 0x110

			i = i+1;
			memory_file[i] = 32'b000100010000_00001_001_00010_0011111;//ori x2 x1 0x110
			
            i = i+1;
			memory_file[i] = 32'b000100010000_00001_010_00010_0011111;//xori x2 x1 0x110

		end
	endmodule

