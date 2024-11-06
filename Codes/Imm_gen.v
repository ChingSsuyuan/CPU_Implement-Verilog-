module imm_gen(
    input [31:0] Instruction32,
    output reg [31:0] imm
);
    
    always @(*) begin
        wire imm12 = Instruction32[31];         
        wire imm10_5 = Instruction32[30:25];   
        wire imm4_1 = Instruction32[11:8];       
        wire imm11 = Instruction32[7];           

        imm = {{20{imm12}}, imm12, imm11, imm10_5, imm4_1, 1'b0};
    end
endmodule
