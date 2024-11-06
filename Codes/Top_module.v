module Top_Module(
    input clk,
    input reset
);
    wire [31:0] pc, pc2, ReadData1, ReadInstruction;
    // 实例化 Program_Counter
    Program_Counter PC(
        .clk(clk),
        .pc2(pc2), 
        .pc(pc)
    );

    // 实例化 Instruction_Memory
    Instruction_Memory IM(
        .Address(pc),
        .ReadData1(ReadData1)
    );

    // 实例化 Main_Control_Unit
    Main_Control_Unit MCU(
        .ReadInstruction(ReadData1),
        .Alucontrol(), 
        .Alusrc(),
        .MemtoReg(),
        .Regwrite(),
        .Memread(),
        .Memwrite(),
        .Branch()
    );

    Register_File(ReadSelect1, ReadSelect2, WriteSelect, WriteData, WriteEnable, ReadData1, ReadData2, clk, rst);
    
    Imm_gen IG(
        .Instruction32(ReadData1),
        .Imm_out(Imm_out)
    );
    
endmodule
