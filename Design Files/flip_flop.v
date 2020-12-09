`timescale 1ns / 1ps

module flip_flop(
    input clk,
    input reset,
    input D,
    output reg Q
    );
    
    always@(clk)begin
    if(reset) Q=0;
    else Q<=D;
    end
    
endmodule
