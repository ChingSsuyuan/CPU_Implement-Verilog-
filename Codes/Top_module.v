`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BU
// Engineer: Siyuan Jing and Haonan Wu
// 
// Create Date: 10/29/2024 02:56:50 PM
// Design Name: 
// Module Name: Top_Module
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
module Top_Module(
    input clk,
    input reset
);
    wire [31:0] pc, pc2, Instruction_out, ReadData1, ReadData2, Imm_out, MuxOut1,MuxOut2, ALU_Result, ReadMemData;
    wire Regwrite, Alusrc, Branch, Zero, Memread, Memwrite;
    wire [3:0] Alucontrol;
    Program_Counter PC(
        .clk(clk),
        .pc2(pc2), 
        .pc(pc)
    );

    
    Instruction_Memory IM(
        .Address(pc),
        .ReadData1(Instruction_out)
    );

   
    Main_Control_Unit MCU(
        .ReadInstruction(Instruction_out),
        .Alucontrol(Alucontrol), 
        .Alusrc(Alusrc),
        .MemtoReg(MemtoReg),
        .Regwrite(Regwrite),
        .Memread(Memread),
        .Memwrite(Memwrite),
        .Branch(Branch)
    );
    
    Imm_gen IG(
        .Instruction32(Instruction_out),
        .Imm_out(Imm_out)
    );
    
    Register_File RF(
        .Instruction32(Instruction_out),
        .WriteData(MuxOut2),
        .WriteEnable(Regwrite),  
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .clk(clk),
        .rst(reset)
    );
    Mux mux_1(
        .A(ReadData2),        
        .B(Imm_out),       
        .S(Alusrc),          
        .Z(MuxOut1)            
    );
    
    Branch_Control BC(
        .immgen(Imm_out),       
        .pc1(pc),               
        .zero(Zero),            
        .branch(Branch),        
        .pc2(pc2)               
    );
    
    ALU alu(
        .A(ReadData1),
        .B(MuxOut1),
        .ALU_Control(Alucontrol),
        .ALU_Result(ALU_Result),
	.zero(Zero)
    );
	
    Data_Memory DM(
	.ALU_Result(ALU_Result),
	.WriteMemData(ReadData2),
	.MemWrite(Memwrite),
	.MemRead(Memread) ,
	,clk(clk),
	,ReadMemData(ReadMemData)
    );

     Mux mux_2(
        .A(ALU_Result),        
        .B(ReadMemData),       
        .S(MemtoReg),          
	.Z(MuxOut2)            
    );
        
endmodule
