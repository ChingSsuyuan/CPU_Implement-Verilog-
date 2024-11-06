`timescale 1ns / 1ps
module Mux(
    input A,
    input B,
    input S,
    output Z
    );
    assign Z = S ? B : A;
endmodule
