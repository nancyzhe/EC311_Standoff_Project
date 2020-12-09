`timescale 1ns / 1ps

module computer_tb(
    );
    
    reg clk,load,reset;
    reg [1:0] p1_bullet,comp_bullet;
    wire [2:0] choice;
    
    simple_computer test(clk,load,reset,p1_bullet,comp_bullet,choice);
    
    initial begin
    clk=0;
    load=0;
    reset=0;
    p1_bullet=0;comp_bullet=0;
    #10 reset=1;
    #10 reset=0;
    #10 load=1;
    #10 load=0;
    #20 p1_bullet=0;comp_bullet=1;
    #23 p1_bullet=0;comp_bullet=2;
    #26 p1_bullet=0;comp_bullet=3;
    #19 p1_bullet=1;comp_bullet=0;
    #22 p1_bullet=1;comp_bullet=1;
    #20 p1_bullet=1;comp_bullet=2;
    #28 p1_bullet=1;comp_bullet=3;
    #17 p1_bullet=2;comp_bullet=0;
    #20 p1_bullet=2;comp_bullet=1;
    #21 p1_bullet=2;comp_bullet=2;
    #26 p1_bullet=2;comp_bullet=3;
    #25 p1_bullet=3;comp_bullet=0;
    #24 p1_bullet=3;comp_bullet=1;
    #19 p1_bullet=3;comp_bullet=2;
    #20 p1_bullet=3;comp_bullet=3; 
    #20 $finish;
    end
    
    always #1 clk=!clk;
    
endmodule
