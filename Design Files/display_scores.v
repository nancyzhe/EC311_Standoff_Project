`timescale 1ns / 1ps

module display_scores(
    input clk,
    input [3:0] p1_dchoice,p2_dchoice,
    input [1:0] p1lives,p2lives,
    output [6:0] segment,
    output [7:0] AN
    );
    
    reg refresh_clk=0;
    
    reg [19:0] refresh_counter = 20'd0;
    
    //drive refresh clock, 100MHz-->1KHz
    always @(posedge clk)
    begin 
        if(refresh_counter==20'd100000)begin //(use counter==20'd100000) 1E5 us = 1 ms (Periods of clk and refresh_clk, respectively) 
            refresh_counter <= 0;
            refresh_clk=~refresh_clk;
        end
        else
            refresh_counter <= refresh_counter + 1;
    end
    
    //iterate anode_counter
    reg [3:0] anode_counter=4'd1;
    always@(posedge refresh_clk)begin
       if(anode_counter==4'd8)
       anode_counter<=1;
       else anode_counter=anode_counter+1;
    end
    
    //activate anodes according to anode_counter
    reg [3:0] bcd;
    reg [7:0] an;
    always@(*)begin
    case(anode_counter)
        1: begin 
            an<=8'b01111111;
            bcd=4'd14;
           end
        2: begin
            an<=8'b10111111;
            bcd=4'd1;
           end 
        3: begin 
            an<=8'b11011111;
            bcd=p1lives;
           end
        4: begin 
            an<=8'b11101111;
            bcd=p1_dchoice;
           end
        5: begin 
            an<=8'b11110111;
            bcd=4'd14;
           end
        6: begin
            an<=8'b11111011;
            bcd<=4'd2;
           end
        7: begin
            an<=8'b11111101;
            bcd<=p2lives;
           end
        8: begin
            an<=8'b11111110;
            bcd<=p2_dchoice;
           end
        default: an<=8'b11111111;
    endcase
    end
    
    //assign segments accordingly
    reg [6:0] seg;
    always@(bcd)
    case(bcd)
    0: seg = 7'b0000001; // "0"     
    1: seg = 7'b1001111; // "1" 
    2: seg = 7'b0010010; // "2" 
    3: seg = 7'b0000110; // "3" 
    4: seg = 7'b1001100; // "4" 
    5: seg = 7'b0100100; // "5" 
    6: seg = 7'b0100000; // "6" 
    7: seg = 7'b0001111; // "7" 
    8: seg = 7'b0000000; // "8"     
    9: seg = 7'b0000100; // "9" 
    10: seg = 7'b1111110; // "-" for idle
    11: seg = 7'b1000010; //"d" for duck
    12: seg = 7'b0111001; //"r" for reload
    13: seg = 7'b0100100; //"5" for shoot
    14: seg = 7'b0011000; //"P" for player
    default: seg = 7'b1111111; //" " for blank
    endcase
    
    assign segment=seg; 
    assign AN=an;
    



endmodule
