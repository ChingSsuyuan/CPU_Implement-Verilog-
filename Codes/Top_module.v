module Top_Module(
    input clk,
    input reset
);
    wire [31:0] pc, pc2, Instruction_out, ReadData1, ReadData2, Imm_out, WriteData, MuxOut1;
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
        .WriteData(),
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
        .immgen(Imm_out),       // 连接 Imm_gen 的输出 Imm_out 到 immune
        .pc1(pc),               // 将 Program_Counter 的 pc 传给 pc1
        .zero(Zero),            // 假设 Zero 信号来自 ALU 或其他逻辑
        .branch(Branch),        // 将 Main_Control_Unit 的 Branch 信号传递到 branch
        .pc2(pc2)               // 将 pc2 连接到 Program_Counter 的 pc2 输入
    );
    
    ALU alu(
        .A(),
        .B(),
        .ALU_Control(),
        .ALU_Result(),
        .zero(Zero)
    );

        
endmodule
