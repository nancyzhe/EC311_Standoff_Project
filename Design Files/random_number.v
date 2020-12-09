`timescale 1ns / 1ps

module random_number(
    input clk,
    input load,reset,
    input [3:0] seed,
    output [3:0] number
    );
    
    wire bit;
    
    lfsr rand(clk,load,reset,seed,bit);
    
    reg [2:0] counter=2'b00;
    reg [3:0] tempnumber;
    
    always@(posedge clk)begin
    if(counter==3)counter<=0;
    else begin
    counter<=counter+1;
    end
    tempnumber[counter]<=bit;
    end
 
    assign number= tempnumber;
    
endmodule
