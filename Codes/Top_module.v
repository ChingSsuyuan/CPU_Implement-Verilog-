module Top_Module(
    input clk,
    input reset
);
    wire [31:0] pc, pc2, ReadData1, ReadData2, ReadInstruction, Imm_out, WriteData, MuxOut;
    wire WriteEnable, Alusrc;

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
    Mux mux_1(
        .A(ReadData2),        // A 输入连接到 ReadData2
        .B(Imm_out),          // B 输入连接到 Imm_out
        .S(Alusrc),           // 选择信号 S 连接到 Alusrc
        .Z(MuxOut)            // Mux 的输出
    );
    
endmodule
