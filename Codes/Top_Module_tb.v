
`timescale 1ns / 1ps

module Top_Module_tb;

    reg clk;
    reg reset;


    Top_Module uut (
        .clk(clk),
        .reset(reset)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    
    initial begin
    
        reset = 1;
        #10;                   
        reset = 0;           
        
   
        #1000;                 

        $stop;
    end

endmodule
