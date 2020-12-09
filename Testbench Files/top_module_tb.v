`timescale 1ns / 1ps


module top_module_tb;

    reg clk;
    reg pause,normal,demo,simulation;
    reg load;
    reg reset;
    reg btnshoot,btnreload,btnduck;
    wire [2:0] p1_LEDbullet,p2_LEDbullet;
    wire [6:0] countdown;
    wire [6:0] seg;
    wire [7:0] AN;
    
    top_module DUT(clk,pause,normal,demo,simulation,load,reset,btnshoot,btnreload,btnduck,p1_LEDbullet,p2_LEDbullet,countdown,seg,AN);
    
    initial begin
    clk = 0;
    load = 0;
    reset = 0;
    btnshoot=0;btnreload=0;btnduck=0;
    pause = 1;
    normal=0;demo=0;simulation=1;
    #5 pause = 0; 
    #2 reset = 1;
    #2 reset = 0;
    #2 load = 1;
    #2 load = 0;
    
    #20 btnshoot=1;
    #10 btnshoot=0;
    
    #20 btnduck=1;
    #10 btnduck=0;
    
    #20 btnshoot=1;
    #10 btnshoot=0;
    
    #20 btnreload=1;
    #10 btnreload=0;
     
    #40 $finish;
    end
    
    always #1 clk = !clk;
    
endmodule
