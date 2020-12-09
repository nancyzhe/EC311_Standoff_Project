`timescale 1ns / 1ps

module top_module(
    input clk,//internal clock at 100Mhz
    input pause,normal,demo,simulation,//control interval between rounds
    input load,//load the random # seed
    input reset,//reset random # to 0
    //input btnshoot,btnreload,btnduck,//select your action
    input PS2_CLK,
    input PS2_DATA,
    output UART_TXD,
    output [2:0] p1_LEDbullet,p2_LEDbullet,
    output [6:0] countdown,//LED countdown
    output [6:0] seg,//controls what digit looks like
    output [7:0] AN,//controls what digit is on
    output speaker_out
    );
    
wire [1:0] p1_bullet,p2_bullet; //bullet count

wire [2:0] p1_choice, p2_choice; //player choices

wire [3:0] p1_vchoice, p2_vchoice; //validated choices

wire p1shot,p2shot; //signals someone getting shot

wire roundtime; //slowed clk for setting roundtime

wire [1:0] p1lives,p2lives; //number of lives for each player

wire [3:0] p1_dchoice,p2_dchoice; //changed to a valid format for diaplay


top_keyboard select(clk,PS2_CLK, PS2_DATA, UART_TXD ,p1_choice);

set_roundtime duration(clk,pause,normal,demo,simulation,roundtime,countdown);
    
bullets_fsm p1bc(p1_bullet,roundtime,p1_choice);
bullets_fsm p2bc(p2_bullet,roundtime,p2_choice);

display_bulletcount bcp1(p1_bullet,p1_LEDbullet);
display_bulletcount bcp2(p2_bullet,p2_LEDbullet);

simple_computer comp(clk,load,reset,p1_bullet,p2_bullet,p2_choice);

choice_valid p1v(p1_bullet,p1_choice,p1_vchoice);
choice_valid p2v(p2_bullet,p2_choice,p2_vchoice);

outcome_calc calc(clk,p1_vchoice,p2_vchoice,p1shot,p2shot);

life_count p1life(p1shot,roundtime,p1lives);
life_count p2life(p2shot,roundtime,p2lives);

display_decoder decodep1(p1_vchoice,p1_dchoice);
display_decoder decodep2(p2_vchoice,p2_dchoice);

display_scores score(clk,p1_dchoice,p2_dchoice,p1lives,p2lives,seg,AN);

audio(clk, speaker_out, p1lives);


endmodule
