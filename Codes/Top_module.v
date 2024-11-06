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
        .Regwrite(WriteEnable),
        .Memread(),
        .Memwrite(),
        .Branch()
    );
    
    Imm_gen IG(
        .Instruction32(ReadData1),
        .Imm_out()
    );
    
    Register_File RF(
        .Instruction32(ReadData1),  // 将 ReadData1 连接到 Instruction32
        .WriteData(),
        .WriteEnable(Regwrite),  // 将 Main_Control_Unit 的 Regwrite 连接到 WriteEnable
        .ReadData1(),
        .ReadData2(),
        .clk(clk),
        .rst(reset)
    );

    
endmodule
