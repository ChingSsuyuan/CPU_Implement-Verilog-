`timescale 1ns / 1ps

module Datapath(clk, rst);

    input clk, rst;
    
//----------------Program Counter----------------//
    
    wire [31:0] InstructionCountIn;
    wire [31:0] InstructionCountOut;
    
    // instantiate program counter

//----------------Instruction Memory----------------//    
    
    wire [31:0] ReadInstruction;
    
    // instantiate instruction memory

//----------------Control Unit----------------//
    
    wire [4:0] ReadReg1Address, ReadReg2Address, WriteRegAddress;
    wire [31:0] Immediate;
    wire ALU_Src, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    wire [3:0] ALU_Control;
                                      
    // instantiate control unit

//----------------Register File----------------//

    /*
    Note: the register file module has two PARAMETERs. The instantiation of the register file also
    needs to set the size of the PARAMETERs; the proper format to do so is provided.
    */

    wire [31:0] ReadRegData1, ReadRegData2;
    wire [31:0] WriteRegData;

    // instantiate: Register_File #(32, 32) regfile(); // #(32, 32) sets the values of the PARAMETERs

//----------------ALU----------------//
    
    wire [31:0] ALU1, ALU2;
    wire [31:0] ALU_Out;
    wire zero;

    // instantiate ALU
            
//----------------Branch Control----------------//
    
    wire select_branch;
    
    // instantiate branch control unit

//----------------Data Memory----------------//

    wire [31:0] ReadMemData;

    // instantiate: Data_Memory #( , ) DMem(); // remember to set the parameters for the data memory
    
endmodule
