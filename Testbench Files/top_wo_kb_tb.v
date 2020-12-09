`timescale 1ns / 1ps

module top_wo_kb_tb(
    );

reg clk;//internal clock at 100Mhz                                
reg pause,normal,demo,simulation;//control interval between rounds
reg load;//load the random # seed                                 
reg reset;//reset random # to 0                                   
reg [2:0] p1_choice;                                              
wire [2:0] p1_LEDbullet,p2_LEDbullet;          
wire [6:0] countdown;//LED countdown           
wire [6:0] seg;//controls what digit looks like
wire [7:0] AN;//controls what digit is on       


top_wo_kb DUT(clk,pause,normal,demo,simulation,load,reset,p1_choice,p1_LEDbullet,p2_LEDbullet,countdown,seg,AN);

initial begin
    clk = 0;
    load = 0;
    reset = 0;
    pause = 1;
    normal=0;demo=0;simulation=1;
    p1_choice=100;
    #5 pause = 0; 
    #2 reset = 1;
    #2 reset = 0;
    #2 load = 1;
    #2 load = 0;
    
    
    #30 p1_choice=010;
    #20 p1_choice=001;
    #20 p1_choice=001;
    #20 p1_choice=010;
    #20 p1_choice=100;
    #20 p1_choice=100;
    #30 p1_choice=010;
    #20 p1_choice=001;
    #20 p1_choice=001;
    #20 p1_choice=010;
    #20 p1_choice=100; 
    
    #20 $finish;
end

always #1 clk=!clk;


endmodule
