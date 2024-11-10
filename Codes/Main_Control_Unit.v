`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Siyuan Jing
// 
// Create Date: 11/04/2024 02:58:47 PM
// Design Name: 
// Module Name: Main_Control_Unit
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


module Main_Control_Unit(
    input [31:0] ReadInstruction,
    output reg [3:0]Alucontrol,
    output reg Alusrc,
    output reg MemtoReg,
    output reg Regwrite,
    output reg Memread,
    output reg Memwrite,
    output reg Branch
    );
    
    wire [2:0]funct3;
    wire Instr30;
    wire [6:0]opcode;
    
    assign opcode = ReadInstruction[6:0];       
    assign funct3 = ReadInstruction[14:12];     
    assign Instr30 = ReadInstruction[30];
    
    initial begin
        Alucontrol=4'b0000;
        Alusrc=  0;
        MemtoReg=0;
        Regwrite=0;
        Memread= 0;
        Memwrite=0;
        Branch= 0;
    end
    always @(*) begin
            if(opcode==7'b1110011)begin 
                    Alusrc=0;
                    MemtoReg=0;
                    Regwrite=1;
                    Memread= 0;
                    Memwrite=0;
                    Branch=  0;
                if(Instr30==1)begin 
                    Alucontrol=4'b0101;
                end
                else begin 
                    case(funct3)
                        3'b000:Alucontrol=4'b0000;
                        3'b001:Alucontrol=4'b0110;
                        3'b010:Alucontrol=4'b0001;
                        3'b100:Alucontrol=4'b0010;
                        3'b101:Alucontrol=4'b0011;
                        3'b110:Alucontrol=4'b0100;
                        3'b111:Alucontrol=4'b0111;
                    endcase 
                end 
            end
            
            if(opcode==7'b1101011)begin //beq  blt
                Alusrc=0;
                MemtoReg=0;
                Regwrite=0;
                Memread= 0;
                Memwrite=0;
                Branch=  1;
                case(funct3)
                    3'b000:Alucontrol=4'b1000;
                    3'b001:Alucontrol=4'b1001;
                endcase 
            end 
            
            if(opcode==7'b1100011)begin //sw
                Alusrc=1;
                MemtoReg=0;
                Regwrite=0;
                Memread= 0;
                Memwrite=1;
                Branch=  0;
                case(funct3)
                    3'b010:Alucontrol=4'b0110;
                endcase 
            end 
            
             if(opcode==7'b1000011)begin //lw
                Alusrc=1;
                MemtoReg=1;
                Regwrite=1;
                Memread= 1;
                Memwrite=0;
                Branch=  0;
                case(funct3)
                    3'b010:Alucontrol=4'b0110;
                endcase 
            end 
            
            if(opcode==7'b0110000)begin //lui
                Alusrc=1;
                MemtoReg=0;
                Regwrite=1;
                Memread= 0;
                Memwrite=0;
                Branch=  0;
                Alucontrol=4'b1100;
            end 
            
            if(opcode==7'b0011111)begin 
                Alusrc=1;
                MemtoReg=0;
                Regwrite=1;
                Memread= 0;
                Memwrite=0;
                Branch=  0;
                case(funct3)
                    3'b000:Alucontrol=4'b0110;//addi 
                    3'b001:Alucontrol=4'b0001;//ori 
                    3'b010:Alucontrol=4'b0010;//xori 
                endcase 
            end 
        end
endmodule 