`timescale 1ns / 1ps


module lfsr(
    input clk, 
    input load,
    input reset,
    input [3:0] seed,
    output bit
    );
    
    wire D1,D2,D3,D4;
    wire Q1,Q2,Q3,Q4;
    wire out;
    
    load_mux m1(load,seed[3],out,D1);
    
    flip_flop ff1(clk,reset,D1,Q1);
    
    load_mux m2(load,seed[2],Q1,D2);
    
    flip_flop ff2(clk,reset,D2,Q2);
    
    load_mux m3(load,seed[1],Q2,D3);
    
    flip_flop ff3(clk,reset,D3,Q3);
    
    load_mux m4(load,seed[0],Q3,D4);
    
    flip_flop ff4(clk,reset,D4,Q4);
    
    xor(out,Q3,Q4);
    
    assign bit=out;
    
endmodule
