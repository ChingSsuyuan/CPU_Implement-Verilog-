
`timescale 1ns / 1ps

module Top_Module_tb;

    reg clk;
    reg reset;

    // 实例化 Top_Module
    Top_Module uut (
        .clk(clk),
        .reset(reset)
    );

    // 时钟周期为10ns，时钟信号的生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 每5ns翻转时钟信号
    end

    // 测试初始化
    initial begin
        // 初始复位信号
        reset = 1;
        #10;                   // 等待10ns
        reset = 0;             // 释放复位信号
        
        // 仿真时间延长
        #200;                  // 等待200ns观察输出

        // 结束仿真
        $stop;
    end

endmodule
