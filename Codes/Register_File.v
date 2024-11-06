module Register_File(Instruction32, WriteData, WriteEnable, ReadData1, ReadData2, clk, rst);
    parameter BITSIZE = 32;
    parameter REGSIZE = 32;
    input [31:0]Instruction32;
    wire [$clog2(REGSIZE)-1:0] ReadSelect1, ReadSelect2, WriteSelect;
    input [BITSIZE-1:0] WriteData;
    input WriteEnable;
    output reg [BITSIZE-1:0] ReadData1, ReadData2;
    input clk, rst;
    assign  ReadSelect1=Instruction32[19:15];
    assign  ReadSelect2=Instruction32[24:20];
    assign  WriteSelect=Instruction32[11:7];
    
    reg [BITSIZE-1:0] reg_file [REGSIZE-1:0];   // Entire list of registers
    
    initial
    begin
        reg_file[0] = 32'b0; // initialize x0 as 0;
    end
    integer i;                                  // Used below to rst all registers

    // Asyncronous read of register file.
    always @(ReadSelect1, reg_file[ReadSelect1])
        begin
            ReadData1 = reg_file[ReadSelect1];
        end

    // Asyncronous read of register file.
    always @(ReadSelect2, reg_file[ReadSelect2])
        begin
            ReadData2 = reg_file[ReadSelect2];
        end

    // Write back to register file on clk edge.
    always @(posedge clk)
        begin
            if (rst)
                for (i=0; i<REGSIZE; i=i+1) reg_file[i] <= 32'b0; // rst all registers
            else
            begin
                if (WriteEnable && WriteSelect != 0)
                    reg_file[WriteSelect] <= WriteData; //If writeback is enabled and not register0.
            end
        end

endmodule
