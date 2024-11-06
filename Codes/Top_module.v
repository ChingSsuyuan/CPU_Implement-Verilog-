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

    
    Instruction_Memory IM(
        .Address(pc),
        .ReadData1(ReadData1)
    );

   
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
        .Imm_out(Imm_out)
    );
    
    Register_File RF(
        .Instruction32(ReadData1),
        .WriteData(),
        .WriteEnable(WriteEnable),  
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .clk(clk),
        .rst(reset)
    );
    Mux mux_1(
        .A(ReadData2),        
        .B(Imm_out),       
        .S(Alusrc),          
        .Z(MuxOut)            
    );
    
endmodule
module Branch_Control(
    input [31:0] immgen,
    input [31:0] pc1,
    input zero,
    input branch,
    output reg [31:0] pc2
    );
